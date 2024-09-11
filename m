Return-Path: <linux-next+bounces-3765-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DF6975B5E
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 22:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 212AEB21A69
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 20:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DD7224CC;
	Wed, 11 Sep 2024 20:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CKmeVMqU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8121BA898
	for <linux-next@vger.kernel.org>; Wed, 11 Sep 2024 20:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726085385; cv=none; b=lBpH0iXzOYAO+7Q9hX18Vi2frdQ3lmnSmObb8jnheCUWHgRTQ1AmKuqbwtHZPE/5wKBitQpZ/3cAz0KUKnq+G6dXvfHCYzjcEnZ/xQTYRRS7s/FNp58TRu9V29Q206R/1nhiYdQeRksmPMbiVRId28uJGWwXOP/kGh4HoVAmQ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726085385; c=relaxed/simple;
	bh=b8lk9rqO700ZqY2AKqDTrzjArj04yVnmgpgLYY/86Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyzFqTq31vQ/LoRhGMg2DXjLM1HKjLpM+QBodtV36UaJRjnZ0pOyf6mbDeomGSSZw8U+y64iKPi1ovut/tvCrGBivx4HMEk3U4RCiZtDAzzZ3MIORZHAWbQtROeX6I9w0cIIlOcole2KAbNreEAlE3DmNK4v+om2Nt8Ln9I0jdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=CKmeVMqU; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6c3f1939d12so1843007b3.2
        for <linux-next@vger.kernel.org>; Wed, 11 Sep 2024 13:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1726085382; x=1726690182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNhAe72EungrYlqh+1GPIStyQ7YkKqwFlhsi8LRyhqE=;
        b=CKmeVMqUUVbCcxrx/kHsaCvE+s8FNitWo4giGr2Llzdaoi3vWGQbY6ln5f04g+IyX2
         Jt8mYoSZQubqCxtYAQ4tBbdvuA/ytWSuBg6eQ8LFCQuhqqsjOh7H5R3FAatn1aWlCSmN
         5C0EWTY+OHg3gRiyugx5RYqNVktQrJ/6E0PkltvaGxm6tQEDruo4Vh+edSAK/nrZmX01
         oKHixkSwcw1ShoYY23jtGiquTWkdRxpaPCheRoZE95p/JdNN2F8OGaMyFR3Gke/RnevM
         PnEsCMPRe4H+WX+zLpNo59iOb+H7psUkZtCTWdXUOX4566ntPubpec/bDd2lKboWWBFA
         YotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726085382; x=1726690182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNhAe72EungrYlqh+1GPIStyQ7YkKqwFlhsi8LRyhqE=;
        b=uG+BTTPNnjEUu2puLTX+MVSeMAsKToVCEM44Vs+S3c9aw47FtNZAcXNKYEHPJ4BPq7
         vVWcuM2JpAK9sxofwWTqPY8ykn3W1Z7J6R+A3Z0Tlr2HMHGSMKAJcPwpEYTLMQMyCIDj
         NR/ACqCivU3Ni1m6+WMPGHW2y66L4vKeaMCtF6JyQZeCMxD2YIFjb5yvxaOxVRDF/fYw
         f/jI1Nx+NJBC7w+Ov7P28y5qyldaZUBWFjMDh8Cd2f+j8xpKt80TRXNSAnDV1l+PbrE5
         OFTjK+TvMP4+/7eeyzSlIqAjIt5ddecYE1f0FtKvVywlLQ6/RLWf95yOQ2185YLnpq7c
         9h/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKJVK1gW9t+piIAkCV1s2Tf7xYvF7mLVexEqOKfv7U+5PdF5dvv+q2fZ9HMmeYzQ+vNZnfTCRYxSUB@vger.kernel.org
X-Gm-Message-State: AOJu0YxvG25WKsPSZwxCAd9fViC2Lx07fCdkzP4vXr66LsezFtT6ANUX
	j7wEDA/u06kKJW/LhF/mBxbE7rjRFK11up4vPgmGC4hvRDeI6ej0PSXQ9vhMO7fixN1cdhYd/wm
	Fm/2iqUtA/H38xtpitsQMevuMcG/AwzDorFNzbJ4A3B4HBws=
X-Google-Smtp-Source: AGHT+IFfNbOYziAqTZC1YVV8UGukieoNsQmEyOv11EiHfSW2LBeR/v0HfGZzwvd/ESuRNgdLqnDvQi3J1PzaH0JgtVQ=
X-Received: by 2002:a05:690c:4a02:b0:632:12b:8315 with SMTP id
 00721157ae682-6dbb6b246d7mr7550997b3.22.1726085382351; Wed, 11 Sep 2024
 13:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911142822.7c65e02e@canb.auug.org.au>
In-Reply-To: <20240911142822.7c65e02e@canb.auug.org.au>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 11 Sep 2024 16:09:31 -0400
Message-ID: <CAHC9VhS2_UZ_9jL=A8WK_RwL8jPamnOqQ6ciUJmGT1J_6E5_Sw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the security tree with the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 12:28=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the security tree got conflicts in:
>
>   include/linux/lsm_hooks.h
>   security/security.c
>
> between commit:
>
>   3346ada04cf5 ("bcachefs: do not use PF_MEMALLOC_NORECLAIM")
>
> from the mm-unstable branch of the mm tree and commit:
>
>   711f5c5ce6c2 ("lsm: cleanup lsm_hooks.h")
>
> from the security tree.
>
> I fixed it up (I used the latter version ofinclude/linux/lsm_hooks.h
> and see below) and can carry the fix as necessary. This is now fixed as
> far as linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

Thanks Stephen.

> diff --cc security/security.c
> index 3581262da5ee,4564a0a1e4ef..000000000000
> --- a/security/security.c
> +++ b/security/security.c
> @@@ -660,7 -745,7 +745,7 @@@ static int lsm_file_alloc(struct file *
>    *
>    * Returns 0, or -ENOMEM if memory can't be allocated.
>    */
> - int lsm_inode_alloc(struct inode *inode, gfp_t gfp)
>  -static int lsm_inode_alloc(struct inode *inode)
> ++static int lsm_inode_alloc(struct inode *inode, gfp_t gfp)
>   {
>         if (!lsm_inode_cache) {
>                 inode->i_security =3D NULL;



--=20
paul-moore.com

