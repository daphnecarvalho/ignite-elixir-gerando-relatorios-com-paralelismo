defmodule GenReportTest do
  use ExUnit.Case

  alias GenReport
  alias GenReport.Support.ReportFixture

  @file_name "gen_report.csv"
  @list_file_name ["part_1.csv", "part_2.csv", "part_3.csv"]

  describe "build/0" do
    test "When no filename is given, returns an error" do
      response = GenReport.build()

      assert response == {:error, "Please inform the file (string)!"}
    end
  end

  describe "build/1" do
    test "When passing file name return a report" do
      response = GenReport.build(@file_name)

      assert response == ReportFixture.build()
    end
  end

  describe "build_from_many/0" do
    test "When no list of files is given, returns an error" do
      response = GenReport.build_from_many()

      assert response == {:error, "Please provide a list of strings!"}
    end
  end

  describe "build_from_many/1" do
    test "when a file list is provided, builds the report (in parallel)" do
      response = GenReport.build_from_many(@list_file_name)

      assert response == ReportFixture.build()
    end

    test "when a file list is not provided, returns an error" do
      response = GenReport.build_from_many("")

      assert response == {:error, "Please provide a list of strings!"}
    end
  end
end
