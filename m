Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3C27154D8A
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2020 21:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgBFUvE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Feb 2020 15:51:04 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39736 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727698AbgBFUvD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Feb 2020 15:51:03 -0500
Received: by mail-qt1-f195.google.com with SMTP id c5so184820qtj.6;
        Thu, 06 Feb 2020 12:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pJ+PCl9owsjzMtwfpKCLj2al72aKvWc2eFjTPYl02mY=;
        b=fV8krVOK0ci36HGl7TfYuz7ULLZR/ooTXleCyIgs6mElCaaqyYsm4dmXsd6KlExdxl
         rD8CkhqIqwWxSGVrNr2aYasuFkfaQSULuVQ2BmPn2hlbEa4X7nqzRqX5nype+v1zRwpE
         sAXOEPcXWrV7UwbpeJ72eKe10WYAXJWLiDrE4U1k/tQffqp4odhs1Oj52PlFnTCoCzrg
         hO4UHWRRTNRZsbV3t8OqouMcm+5HDzoS3tgqbctpRp4Df8Ls4XhRzbci89K7KRndG5fR
         9Prv5vkmsfnKYIgVkso4dpmJNvF5CrMnXnGsiGVbctqQEURLhRKWJS5ctnF2P71cT70Z
         K9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pJ+PCl9owsjzMtwfpKCLj2al72aKvWc2eFjTPYl02mY=;
        b=Pfy9wJI+6yt4pYCSWcVVAXG2q3JAB3jsiNe9Y6ANBmgSR5gRPZoPefTEsfOTAm9vdJ
         XBM8B3DhNR08iweUOTwAod5RwNO63bhoz1OmAYTEC3hX8TshmkNY8qqvRLxdZUqSweXX
         6iYf0kBOpYODW5Ce/tqgEU3DNQ9B1HD1lyDEkABGfdycw++i0xoQ12ELfsi0StuQ5X5T
         D7sujwdLZYiqYge9NONBp+gLK2OtYJDDqA4Wn5kaCljXeHqWnDHUVd4bv0M6JxVHDRlp
         jmwyxkzyveAS0zPb3wxK6R64519JlVdU6oyHgdWYpEa6ZY8pL8N5vaeTO6wEQX6V31Gf
         r2fg==
X-Gm-Message-State: APjAAAXxCc2eMLUNpsgvxTIfniREYo9NcwQdiT80bfmoJu3t1UR5TIbT
        a1FYcAtSjtDywnBS271+Ybd9d9333tOtgYtz+g==
X-Google-Smtp-Source: APXvYqx9s64pEdRcqjTxq93/s2ysYPXRLujSqv+wEkib9QEYCZ3+b1DPRKRQwp8VMGTJH9ZiVM+Bt4zL0nLvhfNuKuM=
X-Received: by 2002:ac8:5513:: with SMTP id j19mr4454880qtq.143.1581022260994;
 Thu, 06 Feb 2020 12:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20200206083418.3a6025f6@canb.auug.org.au> <20200206163019.CCE0E214AF@mail.kernel.org>
In-Reply-To: <20200206163019.CCE0E214AF@mail.kernel.org>
From:   Rob Herring <robherring2@gmail.com>
Date:   Thu, 6 Feb 2020 13:50:46 -0700
Message-ID: <CAL_JsqKxJ9T9a9sDUdVnHgmk5B=24KcXgXm3808EWf-NY=sq7g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the clk tree with the
 devicetree-fixes tree
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 6, 2020 at 9:30 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Stephen Rothwell (2020-02-05 13:34:18)
> > Hi all,
> >
> > Today's linux-next merge of the clk tree got conflicts in:
> >
> >   Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
> >   Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml
> >
> > between commit:
> >
> >   04dbd86539fd ("dt-bindings: Fix paths in schema $id fields")
> >
> > from the devicetree-fixes tree and commits:
> >
> >   e6747e24f15d ("dt-bindings: clock: Fix qcom,gpucc bindings for sdm845/sc7180/msm8998")
> >   8cff43d46cfc ("dt-bindings: clock: Cleanup qcom,videocc bindings for sdm845/sc7180")
> >
> > from the clk tree.
> >
> > I fixed it up (the latter changes seem to have included the former,
> > plus I removed Documentation/devicetree/bindings/clock/qcom,gpucc.yaml)
> > and can carry the fix as necessary.
>
> Thanks Stephen. Rob, you may want to drop the change to qcom,gpucc.yaml
> so that conflicts are reduced.

It's already in Linus' master.

Rob
