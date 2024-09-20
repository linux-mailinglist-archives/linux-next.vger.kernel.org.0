Return-Path: <linux-next+bounces-3929-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41097CFA5
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2024 02:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38A68B22B98
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2024 00:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CCA79C2;
	Fri, 20 Sep 2024 00:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pj0U3mcL"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A136748A;
	Fri, 20 Sep 2024 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726791936; cv=none; b=ZwP55BkWnDH/J/V07tOgG+bkpRqZH4XFALmMtz7jkhsMFV2xFALPg5fs/lVOeyi1xFSBGffPbFU7k5gLzIur/5WSOsJur+bGFSlLSRCACMOlE7p2l2P9llG5fab1l1CuPyAkWz8g4BqqQ1LbpmqbjU/kiBmDN3ANwkMvyLg2Gzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726791936; c=relaxed/simple;
	bh=gNcD89dkoVE7VNiQMFtBj1MC/QhxCNuvbiula/5QRjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TMubSYwiHYFMcWB4A3kM58xj6JLlAHPQwB3my+VcUM75EfgI31Ts9SaBEPzpAWf8GfMX7GZ4mI0WzXvT4+xtf9hf5jt5SfeImcwDTvERwVtfSQXrSm0678GkhCU/OPEpT64c7HOZAOerzWx0ZvGlEhQddq+Mvbuwme8zZCET4L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pj0U3mcL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C375FC4AF0B;
	Fri, 20 Sep 2024 00:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726791935;
	bh=gNcD89dkoVE7VNiQMFtBj1MC/QhxCNuvbiula/5QRjw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pj0U3mcLraHuEzGslnIc+SZZpIDvWzWbguJke/bacNK6/B33o99C+G/xZWYFrTzQw
	 APHwpMEDN1ntpVut3u763b2PAXlCfOU/uZ0u8XrYu4ZftYoaNnbQfDljojnteFybp7
	 JE+gFnmgqKNSwJxmgjU3InKfUUbe+R6o8uuDk/tIa6MKXYVyxnxOh5a8we+q6tFbvc
	 Z4Nr+C+urYYT6TpzpWAvvHSt39Q5+jhyyjc1BZIQ1eQjc1zKkUqPkrmOLtbN/7Ay9Y
	 4LFbBHSGeFX4s7Z1c/MtrY1WFEIxDtbpy6Tur1QtPYL/h54xiVqQScOPxKDOS9ETne
	 SlK4xHjuFQGtQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f763e9e759so16963761fa.3;
        Thu, 19 Sep 2024 17:25:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/NU8NyGxzOdoFfnJd+BhAgT2ep36FaXO/2BqY+pV2UORF87d2obFm5M6o/TSwUQbIngb8OQa/R+/iHcg=@vger.kernel.org, AJvYcCWQUpkTSiL3KR16uYjh504Uq10jo5avp9+d4NNHsR0IjVPmz3lFbcGGdYLp4MCg2J0iNhoQYyfjT6h41Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfB3NQmt+ScnUT8kmY1vieRJ81epWbxdYRBluTE+0ec+cK6rLX
	dITb31plsD/nXgFXl1vf5r1hGVZzNby9YOxv6Al3279WZfdsYVvXkKUvGrMXxExFzPh9se00PAL
	DbepHGElnOirwsU1zL7FS2tuTS8w=
X-Google-Smtp-Source: AGHT+IEIbz/oPfkPfZ91DGkfTRFPx9jMoNPEFGOz+FPOE2wf3d0ecbtBH3SBNrliDq6aP0Sxp+rOA54Gub2ZuIDQTCc=
X-Received: by 2002:a2e:819:0:b0:2f7:5d73:92a3 with SMTP id
 38308e7fff4ca-2f7cb334504mr4110651fa.24.1726791934477; Thu, 19 Sep 2024
 17:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912171646.1523528-1-kris.van.hees@oracle.com>
In-Reply-To: <20240912171646.1523528-1-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 20 Sep 2024 09:24:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR8+29+FnC8AxvucMh2+jfn8QgRG8SkAm_p86nV9iNmGg@mail.gmail.com>
Message-ID: <CAK7LNAR8+29+FnC8AxvucMh2+jfn8QgRG8SkAm_p86nV9iNmGg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: invoke generate_builtin_ranges.awk using gawk explicitly
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 2:17=E2=80=AFAM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> The gawk utility might be installed in different locations depending
> on the distributions, etc.  That means that the locations in the
> shebang at the beginning of the generate_builtin_ranges.awk script
> may not be correct, causing an error.
>
> Use "gawk -f <script> <args>" instead from the Makefile.vmlinux, so
> the $PATH will be used to locate gawk appropriately.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  scripts/Makefile.vmlinux | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index dfb408aa19c6..1284f05555b9 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -39,7 +39,7 @@ ifdef CONFIG_BUILTIN_MODULE_RANGES
>  __default: modules.builtin.ranges
>
>  quiet_cmd_modules_builtin_ranges =3D GEN     $@
> -      cmd_modules_builtin_ranges =3D $(real-prereqs) > $@
> +      cmd_modules_builtin_ranges =3D gawk -f $(real-prereqs) > $@
>
>  targets +=3D modules.builtin.ranges
>  modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
> --
> 2.45.2
>

I squashed this to v10 2/4.
Thanks!


--=20
Best Regards
Masahiro Yamada

