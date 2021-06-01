Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B701039794D
	for <lists+linux-next@lfdr.de>; Tue,  1 Jun 2021 19:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234582AbhFARmE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Jun 2021 13:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234017AbhFARmD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Jun 2021 13:42:03 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290D7C061574
        for <linux-next@vger.kernel.org>; Tue,  1 Jun 2021 10:40:21 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id q1so23101313lfo.3
        for <linux-next@vger.kernel.org>; Tue, 01 Jun 2021 10:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HzpG2mS3klA1VmO0XTe5j7flLzAb8Ei6Y9bSAVhIPY0=;
        b=BQeStbGqRqfaZQTatesVaXUFU7q7jGK8/h3S8s/n4L1EYp+DQRKegAYudAGZZJwmh/
         HD40rIpJmLOgdc8+UC4ZsWwaBUsO96SAIctpyB8jiEMRcOhq8nyd/1IO3eMdK79W2QHE
         clu/SdKKUo+pHt0XaZOTsItqekoQU9JeobVaj8af/bfZMPUIRgqtUBfXlDoUM4/BDpZS
         5Vs6oPV7URtRrA/ci+kXSbYoQcR3gCUlTWbIGruz2h84Gh4taGAMq9Wk1iwO2H5PSraU
         NPtbrrfvxP88aKLpUIqP+cifQXzfbs0G9FWSn9o9p0/egdH8zOsngD3C0DsS+HNjOIy9
         S9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HzpG2mS3klA1VmO0XTe5j7flLzAb8Ei6Y9bSAVhIPY0=;
        b=flUeUStRtVroZM2GmBb6ouATvXold5yEs9oJoCWXsT0uWDlQqbZ01s47aJAFCb6HH2
         g5vlxpD56esGCRniCuofBNtrF66agAZQn5ZPqn8Qyq/5XG77q4wrsxpMrHWMqqvNeH16
         HF5O1XDYgAJ871mpoZezrOTvBt8aiDGgv+UJVcRzadu0J1q6SMuLJITQUl+2i/T+Jbgz
         4shSAGAWEMdGi4TmDDaFaou5M05bgJ5DAuD7ZkfYXinICZ9PANdCpxsTjXCI92v63s4V
         S02AwqyvEqneaMmacuGOpxKNmJIKSTmxh+eoJNgvWcIxCWsxfg7ShzsMbO1DOIGCHKdr
         mMNw==
X-Gm-Message-State: AOAM5329kz24zKTIrivlF4B7MAoHSS38flCCdo50OJVuQhfzVMvXsQeJ
        FPNHtaf0MZCiOEqiTa8QxdPDV7FALUq5e+ndkuXMsA==
X-Google-Smtp-Source: ABdhPJyJAhOJrzT29ukFcKuikSBG+AGooLG/BfxPhyU2dkfzF5uhC1zGelS2+5NUMcPoit3+unRhD2aQB+e2MgRfqEQ=
X-Received: by 2002:a19:f706:: with SMTP id z6mr5395570lfe.122.1622569219194;
 Tue, 01 Jun 2021 10:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210601183002.26176586@canb.auug.org.au>
In-Reply-To: <20210601183002.26176586@canb.auug.org.au>
From:   Rajat Jain <rajatja@google.com>
Date:   Tue, 1 Jun 2021 10:39:42 -0700
Message-ID: <CACK8Z6Fp-_oRkC-dQ4U5y6ZUrr7Q3U084PiP+Q9daYstpps+aA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the usb tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,


On Tue, Jun 1, 2021 at 1:30 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the usb tree, today's linux-next build (htmldocs) produced
> this warning:
>
> Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Unexpected indentation.
> Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Block quote ends without a blank line; unexpected unindent.

I'd be happy to send a patch to fix this, but I didn't really
understand what needs to be done.

Here is the relevant documentation update in the patch:

+What:          /sys/devices/.../removable
+Date:          May 2021
+Contact:       Rajat Jain <rajatxjain@gmail.com>
+Description:
+               Information about whether a given device can be removed from the
+               platform by the user. This is determined by its subsystem in a
+               bus / platform-specific way. This attribute is only present for
+               devices that can support determining such information:
+
+               "removable": device can be removed from the platform by the user
+               "fixed":     device is fixed to the platform / cannot be removed
+                            by the user.
+               "unknown":   The information is unavailable / cannot be deduced.
+
+               Currently this is only supported by USB (which infers the
+               information from a combination of hub descriptor bits and
+               platform-specific data such as ACPI).

I'd be happy to send a patch if you can point me what needs to be done
(or let Stephen / Greg / some one else do it if it is easier to just
do it instead of guiding me).

Thanks,

Rajat

>
> Introduced by commit
>
>   70f400d4d957 ("driver core: Move the "removable" attribute from USB to core")
>
> --
> Cheers,
> Stephen Rothwell
