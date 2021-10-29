Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F92643FD8B
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 15:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbhJ2NtX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Oct 2021 09:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhJ2NtW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Oct 2021 09:49:22 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E99C061570;
        Fri, 29 Oct 2021 06:46:53 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id r12so39059429edt.6;
        Fri, 29 Oct 2021 06:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j56DM4iboxKhG2Oxwlg3r+3tA18trFPQxcYLMdOnnqQ=;
        b=hInrWTsGA9vuISyWF3PR2c1XG29OP86W/VxehlPi7PjASQQLHEVD2oU33Y7YcuECx5
         YpkIyXa1jYtn2EVk5Aer0ieS5CiYIuGkncIcrVnp+RV7WJk4hiPTa/mclx5SKdqFYOCC
         PHoDR7axzbixYZvGeGoIk1Tx8MeX3/GjJ5WXd/ZdmGwbOWd7P/ODIWTODzBgiVYuw88o
         ssoTNUkVpzH1/K48qC4SbtgBwIwRB2sDrsplOb2h1l178hRqLSRD/BMQAo5gCyy4CdJt
         kwltu1IrEKEEMuNWIhT6N2cWfKCk4nd7YRO1goE2Hskc5m9SA0XeNJxAWkyz0Bu8gQO9
         eHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j56DM4iboxKhG2Oxwlg3r+3tA18trFPQxcYLMdOnnqQ=;
        b=bJ5wkpx27J7QZOxYQSYNf7LYhQd+ungUgVvXHxHgAKVV0KWqB30VG0FS3tQbwFpQ4k
         kp2OmApHcNAAixmrK8UuxycaZ0ed3ubdtSInMY0yfgpEeCxnzhcoreBO1Gvle22HswpS
         GH4A4XWlLBa9RSwDh95NIq1rfbgATxK07GmMv3FVfPM1bKjIeK1rVQmVCN5CuBFOxR7u
         8Wbaf23HsEgNS/FbYxNLoYldosGSzyTceObZWQr3w7KkozE6H6d6BGG++tjGbzNQIonW
         rvHD0YRw0pn/v0n7EQ+oaF/cFKSEifIK2mif6d8klj+zipld3MbL3nuF0EUDBr3RCURL
         Lmkg==
X-Gm-Message-State: AOAM532hFDoc1VOQH8Y801djDSVU1joE2G2lhJ3rWxSq1LbjewFYmcTp
        Fncr/kffBGIek24x9ABiyVG4eSP9vXrQ+9QtGHVboQY=
X-Google-Smtp-Source: ABdhPJym2kTp79dc8AuGXzuptUMGgejDwXxqQLzisn35yZ5irMxzJmq0fITPnkLjgkpB/mJ319U67Q4tL+Obh+Cqdbc=
X-Received: by 2002:a05:6402:348c:: with SMTP id v12mr14746402edc.271.1635515212098;
 Fri, 29 Oct 2021 06:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211029131854.042d8202@canb.auug.org.au>
In-Reply-To: <20211029131854.042d8202@canb.auug.org.au>
From:   Rob Herring <robherring2@gmail.com>
Date:   Fri, 29 Oct 2021 08:46:38 -0500
Message-ID: <CAL_JsqLqhZAOJxMcdtxe1bAFpYxG6pjRPSK7fVukUMNp2ucCvA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the iommu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>
Cc:     Joerg Roedel <joro@8bytes.org>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 28, 2021 at 9:19 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>
>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>
> between commit:
>
>   e4a40f15b031 ("dt-bindings: arm-smmu: Add compatible for SM6350 SoC")
>
> from the iommu tree and commit:
>
>   e6b331271d41 ("dt-bindings: arm-smmu: Add compatible for the SDX55 SoC")
>
> from the devicetree tree.

I've dropped it from my tree. Will can pick it up instead.

Rob
