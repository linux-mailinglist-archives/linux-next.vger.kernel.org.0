Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8189A2D65F5
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 20:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404285AbgLJTHe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 14:07:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgLJTHe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 14:07:34 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A402C0617A7;
        Thu, 10 Dec 2020 11:06:37 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id h19so9758161lfc.12;
        Thu, 10 Dec 2020 11:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jK9Y5PkoT1guKY24bhQOaQWJilZMLMWPMge6U32+Mb0=;
        b=t1AUXg0gKvJv8kg3yhKoTf2ou+pIjRSMiVmQt6eSxtEHA0b6fLC0B0aFA50zJmhIWn
         LVzvanXwbqyQTduWy9ExPxjcXBwz1bwwtZ6v5zgW8rBucaLqH1QucwCY6/GSX8Vu3yxj
         jXo96wolOLKZTnNJEfb2ujP4z+Iuwhm1kl4dGSKmGzm4BYrI8GePsUMbAGrPiDyr6hoc
         wXgR3xUDY6Fjlvg6vXWlL9K/hlEyhmRLkkHXAxKrLAGH9QLyZ2YOw/7arWdR70FZP37j
         /70s737t3sgoTbVqmFtTDPdp93LddlWdwwjQ68bvMGzMgNayI9xV4o0EztA+KVnoB+Uc
         pr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jK9Y5PkoT1guKY24bhQOaQWJilZMLMWPMge6U32+Mb0=;
        b=DQH/hRdUFw9YpWbCT1vEA+m/qhOoUGU9STofH0s+71TWlImhaiRrBIbpIcE5CqqW8C
         3Z6C6O/rFp3KQjOvy+39EJUqzGmy/ed4SLXp5O4kukX/xUfr4m1vqUJ5ZQbVsxjuG4x9
         ggZ/9TbhnV1kV6Zu66o/FCCqqotzsB1+vCNQ1QAbWXk2TyLWY+ECrpMXeCVhPKsmWVs9
         Jvgt5DcGAY1o5qB5KISl5GfLBbztsw3W4B1HTqurm8p6LLOwQhEonrqjcVESpCHpSErT
         w+rMxSUAEnR4szzDd7v6vQVaI1Fb12eGnvYthpsTywRZT5s75IecnLgiFv2pSwJoruFm
         oc8Q==
X-Gm-Message-State: AOAM530hMvRWC/cG/pNVKJ0Jz7fsevOUjpD9GBYDovND/wMwW6N5oUDN
        VYf8XiIbtvQ5uzh974SGOp1SBPe/43fL2YafpOvRSdgEhZo=
X-Google-Smtp-Source: ABdhPJx9R9PirOjKLDlJPKHecDmbjkwF2WeSxAs5IaHJ3fSeK5t+jruwglrXCttjE9+txL0mJanClLR/JHBRitX1JWw=
X-Received: by 2002:ac2:48b2:: with SMTP id u18mr3385681lfg.313.1607627195787;
 Thu, 10 Dec 2020 11:06:35 -0800 (PST)
MIME-Version: 1.0
References: <20201210214537.229c7ad9@canb.auug.org.au>
In-Reply-To: <20201210214537.229c7ad9@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Thu, 10 Dec 2020 13:06:24 -0600
Message-ID: <CAH2r5mu9_KFrnmpXzLzHV3mpE9yvtksz=5f0XGbvjC+_n+3VMQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

fixed and repushed to cifs-2.6.git for-next

On Thu, Dec 10, 2020 at 4:45 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   7e9c48d305d5 ("cifs: remove the devname argument to cifs_compose_mount_options")
>
> is missing a Signed-off-by from its committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
