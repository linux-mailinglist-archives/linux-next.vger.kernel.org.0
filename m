Return-Path: <linux-next+bounces-9173-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 694E8C7FE86
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 11:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 14386344C9F
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 10:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5091B86C7;
	Mon, 24 Nov 2025 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F77lQ7Vj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409A92517AA
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2025 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980362; cv=none; b=d+Px6kocnwBamCt3P9BOag8vsht8bJyJTjaDNLKCsZL99BF2Jc+n40wwK4N1/pWEQm2PFS8YfpdmV3hHyYHp4BAxIx96T3/uHsNcCKVM+QmcHx2vBG3hOKtk0QttPEJSRLHF93lwcV8KQNQjTn0QKG8/eZA7wR1paQ5tkbAAjN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980362; c=relaxed/simple;
	bh=lnpwMA7XoaQ9Sp9ifSaF1CDQ7YjpZqUMsHxeEZ0XSOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qUdbVqp2wfv2Yu9JWe3e7OCI99Oq32FwHL2/IGF1SXwdDwnv9A9DkvN3nvMDsomarvBnm6WhzMm6kxhfXHEI+420+Ksm9VOJXXYZnPXQKtyaRVcdUKn+qMBHh9AjYced9pe53OlbaDYW4mjs6Ovh3mONS+ZNgqOkXqeFmzwHyJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F77lQ7Vj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6EB9C16AAE
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2025 10:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763980361;
	bh=lnpwMA7XoaQ9Sp9ifSaF1CDQ7YjpZqUMsHxeEZ0XSOo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F77lQ7Vj2Y+HjVWKwCoQohTqEIBnXB0rMsPjSEpFnXxPndG6L/3sl5Kn9sl3lWSZX
	 UUORtQGbf88DBuNxPgzPo//FQC2aB6b7atyy4yUOkfEgbfbia0jWuigXZKWBkpLLr5
	 q0tqS8DNvDYLoc2L7Ky08OxGbjAmi6+LA4gVKHqAJh294vNgEryKPZwQzF6HOIcAtW
	 6JrouAOq9ex6OW2exA/+S3zDwNkpUA1nWYb++POwSzxFnwRbrcblPNodRIghtj7EoU
	 n8HUnRXLsLtY5aO3xEAA3u7KaoNyGVjD8mC7JpScX+pu5lJh7dj9mUizFR3Gj1dDVn
	 P82wVqiCJRf1Q==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-3eae4e590a4so1424122fac.1
        for <linux-next@vger.kernel.org>; Mon, 24 Nov 2025 02:32:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVK63GDEFhGR0YGtKLd4fIK+14KjJm5q0G6eT3CzJDDdxnB6hzHvYf+6vnbv4vw1VHDVL4oJRxDQQB9@vger.kernel.org
X-Gm-Message-State: AOJu0YxhKBJV/gCkOwLXHFN1BfuCpWIej5gGBC7AQxpgF2Xm5bVj4fM/
	sFZ1+ZLQnTJuXVxeGlHuh39wV8q9BQA8jgirnMsBy1Vi1prXu3rkArJAH5bES1+GJtP5+zcECGy
	RaZ18qAJdOV8ALiRE/GMOoTngzs41nbw=
X-Google-Smtp-Source: AGHT+IHmbH+iqDW/J+LAMkLu09aYYSBq7SfsiuNtLUZZtBdeUoxHvWcLl5YCP85Lux5QtVCowO9Hhkt8FlDloRS9Af4=
X-Received: by 2002:a05:6808:2f15:b0:450:caf8:eba2 with SMTP id
 5614622812f47-45115b19735mr4894040b6e.57.1763980361234; Mon, 24 Nov 2025
 02:32:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124123944.68ab5dda@canb.auug.org.au>
In-Reply-To: <20251124123944.68ab5dda@canb.auug.org.au>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 24 Nov 2025 11:32:26 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h84Ev_diV4thNZRqEfmqFDXXszR5Z5CVXuWtotn9kQyw@mail.gmail.com>
X-Gm-Features: AWmQ_blQ7ImIt6YcMeudmGB4RruacoJfbrh9ptNpWRR7YuWnifd6-u9jekaGx7I
Message-ID: <CAJZ5v0h84Ev_diV4thNZRqEfmqFDXXszR5Z5CVXuWtotn9kQyw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pm tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Samuel Wu <wusamuel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 24, 2025 at 2:39=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the pm tree got a conflict in:
>
>   kernel/power/hibernate.c
>
> between commit:
>
>   a3f8f8662771 ("power: always freeze efivarfs")
>
> from Linus' tree and commit:
>
>   8e2d57e6539b ("PM: sleep: Call pm_sleep_fs_sync() instead of ksys_sync_=
helper()")
>
> from the pm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc kernel/power/hibernate.c
> index 26e45f86b955,7fed1cd36e4d..000000000000
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@@ -820,8 -820,12 +820,11 @@@ int hibernate(void
>         if (error)
>                 goto Restore;
>
> -       ksys_sync_helper();
> +       error =3D pm_sleep_fs_sync();
> +       if (error)
> +               goto Notify;
> +
>  -      if (filesystem_freeze_enabled)
>  -              filesystems_freeze();
>  +      filesystems_freeze(filesystem_freeze_enabled);
>
>         error =3D freeze_processes();
>         if (error)

Thanks for resolving this, it looks good to me.

