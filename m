Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81AB23AD6DD
	for <lists+linux-next@lfdr.de>; Sat, 19 Jun 2021 04:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235571AbhFSC5H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Jun 2021 22:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234263AbhFSC5H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Jun 2021 22:57:07 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5757C061574;
        Fri, 18 Jun 2021 19:54:56 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id v12so5637617plo.10;
        Fri, 18 Jun 2021 19:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=Qm/LGU7W75aN0DFRrKWxwUIu8JdECUu7qWute3z2ogk=;
        b=PsQpIrSipbzbf4PZG5+3tHsyeHqXWyaY1X4eAhpgkQTUY7SHWQWBbBqHTOwx0APlIB
         WbLj2enImC8SZMl8W63BkcQWKlgjjGkLiMEnImjoH1O5E5yBclotwWGtyttQvTLsOvkT
         6V9MaeVTg9CpVwX3rzs1RVL4Aw89ID+rLRmFo/Fr6MU6WGpPaNFTOZ8kehaIOw+j7Xnj
         LEWZ1neZKvo8t2zO8EwRwYwIgH1S5mReguDxFmmb2NzhmpMx8o6h0MXTVxt9/ihyW6b0
         zjx31jt6mNiKMMWYvbEpNZ7cJD2zuj0ij+XhSeEk6jlq4w9MMrHQQ/InqpyM78qcloyc
         HW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=Qm/LGU7W75aN0DFRrKWxwUIu8JdECUu7qWute3z2ogk=;
        b=ZnqjB5EoHoPaxkywLN4a25RFGeMGB8fA81m8CMjXWdHysKFTChha8C+ts2VhdhkY7j
         sejkLLRm8iI+ifS/5qTJ36cp2o4L6L9G36fvGPf9CfJVh+GNF634iPnyUJGmv+Xdb4zz
         G3GqEsixtuU/wZ59BPoC6k5Ws+clj1qsI73rg0bkBX1n/BT1Uoq9dy1t501dbrzVQC7a
         mDpz88juiTbnQLE7D+MwtpC0qjp17EFRqlZZEiPxoJsoIw4J7FsjXqw12yV7cAs725wm
         HfvUood5mEjSQGDsxHZPYHLiT0F6FMmjyTHcRTMyMDv7zH3wrtLbTZBqCNRBV70MN27O
         NwJQ==
X-Gm-Message-State: AOAM532BkFWlMhP5m/vgw3LqG1PNaegAOyVp2I/YmB5pPZTJ3j8VYxfC
        Gjdk1gVhN0hKYGLYAQ6JUvA=
X-Google-Smtp-Source: ABdhPJyqH7ViLeRB+FzWYOQ3vCq1H+mXD6TGmS95TYmAhoGG8iLkWsaQTJEmu5/Xukv8LchZhr0SNA==
X-Received: by 2002:a17:902:db10:b029:120:9e54:2c09 with SMTP id m16-20020a170902db10b02901209e542c09mr7685042plx.0.1624071296335;
        Fri, 18 Jun 2021 19:54:56 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
        by smtp.gmail.com with ESMTPSA id f205sm1584766pfa.154.2021.06.18.19.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 19:54:56 -0700 (PDT)
Date:   Sat, 19 Jun 2021 12:54:50 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 powerpc tree
To:     Andrew Morton <akpm@linux-foundation.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kernel =?iso-8859-1?q?Mailing=0A?= List 
        <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210618194455.0d6c278c@canb.auug.org.au>
In-Reply-To: <20210618194455.0d6c278c@canb.auug.org.au>
MIME-Version: 1.0
Message-Id: <1624071243.qkc40fnx8l.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Excerpts from Stephen Rothwell's message of June 18, 2021 7:44 pm:
> Hi all,
>=20
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   arch/powerpc/kernel/smp.c
>=20
> between commit:
>=20
>   86f46f343272 ("powerpc/32s: Initialise KUAP and KUEP in C")
>=20
> from the powerpc tree and commit:
>=20
>   103e676c91d0 ("lazy tlb: introduce lazy mm refcount helper functions")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This is the correct merge.

Thanks,
Nick

>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/powerpc/kernel/smp.c
> index b83a59ce9beb,b289f1d213f8..000000000000
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@@ -1541,11 -1541,7 +1541,11 @@@ void start_secondary(void *unused
>   {
>   	unsigned int cpu =3D raw_smp_processor_id();
>  =20
>  +	/* PPC64 calls setup_kup() in early_setup_secondary() */
>  +	if (IS_ENABLED(CONFIG_PPC32))
>  +		setup_kup();
>  +
> - 	mmgrab(&init_mm);
> + 	mmgrab_lazy_tlb(&init_mm);
>   	current->active_mm =3D &init_mm;
>  =20
>   	smp_store_cpu_info(cpu);
>=20
