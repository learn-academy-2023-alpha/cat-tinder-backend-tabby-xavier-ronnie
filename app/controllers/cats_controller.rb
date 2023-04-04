class CatsController < ApplicationController
    def create
        cat = Cat.create(cat_params)
        if cat.valid?
          render json: cat
         else
           render json: cat.errors, status: 422
         end
      end
    end