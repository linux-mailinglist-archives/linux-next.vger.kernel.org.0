Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E121ECADB
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 09:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgFCH5c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 03:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgFCH5c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 03:57:32 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC9BC05BD43
        for <linux-next@vger.kernel.org>; Wed,  3 Jun 2020 00:57:31 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id gl26so1123307ejb.11
        for <linux-next@vger.kernel.org>; Wed, 03 Jun 2020 00:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lxoRuIh90rY9DpVRcvm+rLN9RzBy0erXS20mSlblvHI=;
        b=Ja4tUseE5oHLTFvnmh3qPNnAmtzcyovPEbImgvQ/hRBAgqCpIpDcjHk/fM97tE/xN9
         OqNUBt8hVl7yhh/wkauotUIdKegwmOnrmouSIFaBnvhknpg8yKvQJKw3OcibstjJKiiq
         7hziOKpu4bDud3sN5GnkzClUO78xbHwf/2bCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lxoRuIh90rY9DpVRcvm+rLN9RzBy0erXS20mSlblvHI=;
        b=uLwLV1z3ssJFV9stAgnKzQOCmomu+bHrfLXJnzA3WVoqpV7XBJ2lwEh2cKDD8R77ZS
         /AxBci/soYX1A3qn267TD/BnoIlVXUuJyX86fvlZZbYkelCGavSiNM/WFWvhaXAgHztl
         U1br/YgAkjJt3ks2S3P9ju5cAsaAkl/iHPGOPnjW4SH3FAIG6Z8ksClTAO7FBkNDHwOv
         we/QQ7rUaHatd3pzj9iPGRoyE2n598JWLsy9VfmWmWM6+YXDxB3WgwRFlAO++Nx2T8sZ
         NrOAHY30opLnOWiaurayljvItBQD7CtdwxpDYxW6jDcvjgWLO3/9WIElVsCK8QmyNNVH
         qkEQ==
X-Gm-Message-State: AOAM530KhvDZFo7nbMAb2qgnSPWo8oWdkVAUSWW6aP3KAAS9GieX0rBZ
        LBdZdrbjE6ykn+IJmjeonsFll6Yv+fGUu2sfptOSByREack=
X-Google-Smtp-Source: ABdhPJxD5xkb6zLhUJCd3fhHmXYeT1hr5cgGs9sGjsJ6Md/Kn6iCgTNZaEUF0VvohBJxgk05tl+89MKWwtTL5k7x/rc=
X-Received: by 2002:a17:906:f0c3:: with SMTP id dk3mr1568215ejb.202.1591171050552;
 Wed, 03 Jun 2020 00:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200603115127.28b01992@canb.auug.org.au>
In-Reply-To: <20200603115127.28b01992@canb.auug.org.au>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Wed, 3 Jun 2020 09:57:19 +0200
Message-ID: <CAJfpegv1RumBbb4egojmmgJKc7gfogXCzK8BQxzbQyKGXGLmwA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the overlayfs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        LSM <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 3, 2020 at 3:51 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the overlayfs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: modpost: "security_file_ioctl" [fs/overlayfs/overlay.ko] undefined!
>
> Caused by commit
>
>   b5940870e166 ("ovl: call secutiry hook in ovl_real_ioctl()")
>
> I have applied this patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 3 Jun 2020 11:44:19 +1000
> Subject: [PATCH] export security_file_ioctl
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>


Thanks, folded.

Miklos
