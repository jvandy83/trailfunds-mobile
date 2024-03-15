import React from "react";
import { Text, View, ScrollView } from "react-native";
import { MainLayout } from "@components/layout/MainLayout";

export const About = () => {
  return (
    <MainLayout
      styleProp={{
        height: "100%",
        width: "100%",
        alignItems: "center",
        justifyContent: "center",
      }}
    >
      <View style={{ flex: 1, paddingTop: "20%" }}>
        <ScrollView
          contentContainerStyle={{
            alignItems: "center",

            paddingHorizontal: 8,
            overflow: "hidden",
          }}
        >
          <Text
            style={{
              fontSize: 22,
              fontWeight: "600",
              paddingBottom: 10,
              textAlign: "center",
            }}
          >
            Welcome to Trail Funds - Loving Our Trails Back to Life!
          </Text>
          <Text
            style={{
              fontSize: 16,
              fontWeight: "300",
              paddingBottom: 16,
              textAlign: "center",
            }}
          >
            We're passionate about building and revitalizing our beloved trails!
          </Text>
          <View style={{ paddingHorizontal: 4 }}>
            <Text style={{ paddingBottom: 10 }}>
              In the United States alone, there's a staggering $100 billion
              backlog of trail maintenance awaiting attention. Thankfully, Trail
              Maintenance Organizations are the unsung heroes doing the heavy
              lifting. They work hand in hand with the BLM, Forest Service, and
              other land managers to meticulously plan, construct, and maintain
              trails and their accompanying infrastructure.
            </Text>
            <Text style={{ paddingBottom: 10 }}>
              Take, for instance, the incredible Palisade Plunge trail. From its
              inception to its grand opening, it took an astonishing ten years
              of dedication and hard work.
            </Text>
            <Text style={{ paddingBottom: 10 }}>
              However, these organizations are predominantly powered by
              volunteers and are often lacking the necessary resources. Despite
              their remarkable efforts, they operate without the support of
              substantial funding. And that's where we come in.
            </Text>
            <Text style={{ paddingBottom: 10 }}>
              Recognizing that land managers simply don't have the funds to make
              a significant dent in the trail maintenance backlog, we're
              determined to change the status quo. Through user-determined
              donations, we enable you to prioritize the trails that matter most
              to you.
            </Text>
            <Text style={{ paddingBottom: 10 }}>
              Think of us as the "Switzerland" of trail funding apps. Our goal
              is to ensure that a minimum of 80% of your donation directly
              benefits trail organizations, providing them with an additional
              funding stream and access to cutting-edge technology.
            </Text>
            <Text>
              Join us in our mission to breathe new life into our trails.
              Together, we can make a lasting impact and create a trail system
              that we can all be proud of.
            </Text>
          </View>
        </ScrollView>
      </View>
    </MainLayout>
  );
};
