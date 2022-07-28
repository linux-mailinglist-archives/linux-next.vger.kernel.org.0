Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F157583823
	for <lists+linux-next@lfdr.de>; Thu, 28 Jul 2022 07:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbiG1FfG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Jul 2022 01:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiG1FfF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Jul 2022 01:35:05 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5192F5465D
        for <linux-next@vger.kernel.org>; Wed, 27 Jul 2022 22:35:03 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id oy13so1301301ejb.1
        for <linux-next@vger.kernel.org>; Wed, 27 Jul 2022 22:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sbR9raOV1zF+9/IjbCz4W1LZZHaNay6Pd9Un1mvpRiU=;
        b=rToq43S7L9MRXvydWLR5igo2zcboAd2C5cejRmQzNE3woT9iU24zx/9sZzHmIRxMyk
         bN7Az7+7dzs2RFq1JnDFGXDJQ4Z1KcHW97f8gQ3lrGMmEFy3EYSoLkMYa2ium8DGGySo
         MNNxnDYP7eEfVdDM03cv4NZc31uetlrKx7lDz5KcvKty+B5OE2x6HeLR2olOms0hB+Fi
         Bu02efRuP/LCFkVmfy5yVz+tyiChYa34rNQRBOx5dclMSwXpaL280kCG2kBskohwKOxn
         GU1qdiwfHqg61iIB6FZt7l7Z+vZDBMeHFy1yhVX0Ic82+64qZ1I9RQ2fq6eRwtk0uSqG
         2BLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sbR9raOV1zF+9/IjbCz4W1LZZHaNay6Pd9Un1mvpRiU=;
        b=Go323rAS9ajj4fyerVLes/lnhjU5fZRsJ9pSxl7JxwGoBFoxmj0VUjQJ//+NMdazgg
         Sg+MYqAUTt3X3ZLOi+3fB7r6iF6x1eqQKholmqYz60e1lyT+PQ6vBOGs986Ita+E4ubU
         uR8KNjyN61De/UaQiDZOTY4QuzTyulTcWmDN3IXyroYqiKXnb/5moSbeOImC/wBPFdNS
         qcMo3boNImcU3s84oSzzmGPp2UMdaIGldBCJ6dGmkqZTG9OD0rtC9Dc7XzJg5T7D+1Ne
         FDDtojdJ6MU7zjxGQGB8DiJF8QGxT0kUmzetzvbobTCXMS2Z+2rwNBcO+CpJkOCSD1ub
         pS2g==
X-Gm-Message-State: AJIora+aAs6L7jrHik8CHCHywVhiuoKYbty4J6G5VPBhtL8Qcnzdzpo/
        JrAuKD8CXVTBG0WVAJ14a5pOwg/7sLWBausZChu+lQ==
X-Google-Smtp-Source: AGRyM1sAlC/g2qMEZqaOZnp+L70k1DPQR5wX7uHWbhD+3nSoTyyN1BhOU3xKKS7zIwCMQxeAjd5T75k5nbC7zhZkjes=
X-Received: by 2002:a17:907:7294:b0:72b:1ae:9c47 with SMTP id
 dt20-20020a170907729400b0072b01ae9c47mr19979458ejc.253.1658986501786; Wed, 27
 Jul 2022 22:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYt_cc5SiNv1Vbse=HYY_+uc+9OYPZuJ-x59bROSaLN6fw@mail.gmail.com>
 <CAGETcx8bGwDkPP=d2MtcY69YmTyckUSa8xAwNVOPOyTR8jPk=A@mail.gmail.com>
In-Reply-To: <CAGETcx8bGwDkPP=d2MtcY69YmTyckUSa8xAwNVOPOyTR8jPk=A@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 28 Jul 2022 11:04:49 +0530
Message-ID: <CA+G9fYv0DFZi2rMPQTHvK8yD7g0LZTxN76iKZxP4pi4+8Rstxg@mail.gmail.com>
Subject: Re: [next] arm: PM: domains: Delete usage of driver_deferred_probe_check_state()
To:     Saravana Kannan <saravanak@google.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Saravana,

On Thu, 28 Jul 2022 at 00:19, Saravana Kannan <saravanak@google.com> wrote:
>
> On Tue, Jul 26, 2022 at 11:44 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > Linux next arm BeagleBoard x15 device boot failed due to the
>
> Can you point me to the dts file that corresponds to this board
> please? And if you know which devices are power domains, that'd be
> handy too. For now, I'm reverting this patch.
metadata:
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 9250d2f72dc46a808b6aa23bf50dd670f1f52ddc
  git_describe: v5.19-rc7-13490-g9250d2f72dc4
  git_ref: master
  kernel_version: 5.19.0-rc8
  kernel-config: https://builds.tuxbuild.com/2CWh3jswUGEkjvfXQPGXdOceMFH/config
  artifact-location: https://builds.tuxbuild.com/2CWh3jswUGEkjvfXQPGXdOceMFH
  toolchain: gcc-10

I am sharing a few urls, metadata, test job link and device details link.

      kernel:
        url: https://builds.tuxbuild.com/2CWh3jswUGEkjvfXQPGXdOceMFH/zImage
      dtb:
        url: https://builds.tuxbuild.com/2CWh3jswUGEkjvfXQPGXdOceMFH/dtbs/am57xx-beagle-x15.dtb
      modules:
        url: https://builds.tuxbuild.com/2CWh3jswUGEkjvfXQPGXdOceMFH/modules.tar.xz

Test jobs url:
       - https://lkft.validation.linaro.org/scheduler/job/5326314#L1982

Device details link,
      - https://www.ti.com/tool/BEAGLEBOARD-X15

metadata:
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 9250d2f72dc46a808b6aa23bf50dd670f1f52ddc
  git_describe: v5.19-rc7-13490-g9250d2f72dc4
  git_ref: master
  kernel_version: 5.19.0-rc8
  kernel-config: https://builds.tuxbuild.com/2CWh3jswUGEkjvfXQPGXdOceMFH/config
  artifact-location: https://builds.tuxbuild.com/2CWh3jswUGEkjvfXQPGXdOceMFH
  toolchain: gcc-10

- Naresh
