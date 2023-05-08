module Api
  module V1
    class AuthenticationController < ApplicationController
      class AuthenticateError < StandardError; end

      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      rescue_from AuthenticateError, with: :handle_unauthenticated

      def create
        if user
          raise AuthenticateError unless user.authenticate(params.require(:password))

          render json: UserRepresenter.new(user).as_json, status: :created
        else
          render json: { error: 'No such user; check the submitted username' }, status: :unauthorized
        end
      end

      private

      def user
        @user ||= User.find_by(username: params.require(:username))
      end

      def parameter_missing(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end

      def handle_unauthenticated(error)
        render json: { error: error.message }, status: :unauthorized
      end
    end
  end
end
