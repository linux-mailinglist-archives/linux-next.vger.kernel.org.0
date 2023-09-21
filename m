Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6309D7A9FCB
	for <lists+linux-next@lfdr.de>; Thu, 21 Sep 2023 22:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbjIUU1p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Sep 2023 16:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbjIUU13 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Sep 2023 16:27:29 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EF78ED67
        for <linux-next@vger.kernel.org>; Thu, 21 Sep 2023 10:45:15 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50325ce89e9so2068929e87.0
        for <linux-next@vger.kernel.org>; Thu, 21 Sep 2023 10:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695318314; x=1695923114; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8eS5EsLnF+3eMR0Okk+7DiUYY6jE3GaH2tKxaZiXFU=;
        b=gyLcsLx6ujCv6ceKUj05MxgeQjZjLWJoh4fjNfVjegSGrMaKYmO/72S3WXtKa5AdDh
         6DRToskPXQtTbfwQd+Lz3jRHePxg0TlClpigrgMjGksZQ+cQT+JrH1fL+53refomVHkV
         2unkZDGpTv6gj+gemf6FiEBKQVBr7M/zU8FkqV7qau7iwX+LEfJjCi+65coDzbSEFI6M
         4fm7XCFc9uKPrJA6zQLVtaV8gM5RZDd+HPdmglvypd4fzr3v0UpNKsQkLtXzrFnhKwi+
         /CZpCDAt7UTJz+ivywgWv6PghhUcZ39pLGTjF3z5hsRIZaKDsDyYK4jm9xA8HAtE42Dp
         QXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695318314; x=1695923114;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q8eS5EsLnF+3eMR0Okk+7DiUYY6jE3GaH2tKxaZiXFU=;
        b=Tb7EOqDvfuZYwMN0oy4hIEIu70EFlgyOdnDjzuQNheXxC+9lRW3eD7mG45/5dH1QNJ
         cBgxByuYI8f9653vqw/iLjKFv7rSHem1Xb2tkapWVwreT5dmaDpiOthE5gsO1TYLS2O7
         3YTvtqOGEHXZRxMVio026cyOqMMQAnLui5WTgTcgRa/HKQAsQB9VVOLfbnfSuqNXwLvE
         IeSOKXZZsBzxQdKbCS/pyzvqwtnzm7L1bqRQ4bvPYYhn3O/xOEH4nvmM9uElrozksaeL
         qlArgb6hHsl6jPPxeU+/YvdTdtEQddSsI81GlmZyqOfvU39cK0WTcwzofVT5A26dDLx5
         wrdw==
X-Gm-Message-State: AOJu0YzFjL99htYIjVCcqxpRke/TrTh7PmW6Pz6W7asFfC5sR7x95h1n
        2Fhi/uNlg34F1mw/1otEs1K2uqJqw5o+wJu+7TvTfA==
X-Google-Smtp-Source: AGHT+IH0xC3AnMjYLD8sk+f9VGN5MFIAOGTQLEfy1gXzGtJvdU7IH7Xk3Rmde+6cngEOiB0uUj1Zrg==
X-Received: by 2002:a2e:86c9:0:b0:2c0:d44:6162 with SMTP id n9-20020a2e86c9000000b002c00d446162mr3655168ljj.12.1695277809976;
        Wed, 20 Sep 2023 23:30:09 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906278b00b00977eec7b7e8sm555508ejc.68.2023.09.20.23.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 23:30:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 21 Sep 2023 08:30:08 +0200
Message-Id: <CVODTTU89L11.Y3SSDO2Y9A35@otso>
Cc:     "Bjorn Andersson" <andersson@kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the qcom tree
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Stephen Rothwell" <sfr@canb.auug.org.au>,
        "Andy Gross" <agross@kernel.org>
X-Mailer: aerc 0.15.2
References: <20230921084252.3c5ab501@canb.auug.org.au>
In-Reply-To: <20230921084252.3c5ab501@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu Sep 21, 2023 at 12:42 AM CEST, Stephen Rothwell wrote:
> Hi all,
>
> After merging the qcom tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> Error: scripts/dtc/include-prefixes/arm64/qcom/pm7250b.dtsi:44.10-11 synt=
ax error
> FATAL ERROR: Unable to parse input tree
>
> Caused (exposed) by commit
>
>   eee9602ad649 ("arm64: dts: qcom: qcm6490: Add device-tree for Fairphone=
 5")

Hi, this should be caused by
"arm64: dts: qcom: pm7250b: make SID configurable"

It seems I've missed updating one arm32 dts file, I'll send a patch for
this shortly.

Sorry about that.

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/=
qcom/qcom-sdx65-mtp.dts
index fcf1c51c5e7a..9649c859a2c3 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
@@ -4,6 +4,10 @@
  */
 /dts-v1/;
=20
+/* PM7250B is configured to use SID2/3 */
+#define PM7250B_SID 2
+#define PM7250B_SID1 3
+
 #include "qcom-sdx65.dtsi"
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <arm64/qcom/pmk8350.dtsi>

>
> I have used the qcom tree from next-20230920 for today.

