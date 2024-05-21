Return-Path: <linux-next+bounces-2367-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE688CA7C2
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 07:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FA6B1C20FCE
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 05:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FB3C14F;
	Tue, 21 May 2024 05:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfdnnqkG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC2C18040;
	Tue, 21 May 2024 05:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716270589; cv=none; b=diFtqcctP6u2rjAB+FPIec0XM0baen7Bz6RKo1vvIQMnglRu2LqmDQRj//63DwCKh7UcAw9mvAl5Wpep4tmXaekruxkP5uI7BKDRKJ5j3U84x7WI2WAa8DwZdhVMSTV8ih/ASgNEtuInyLfB3/zv8OTHl3pjfF63y/9rvMkE1E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716270589; c=relaxed/simple;
	bh=YvXGNsBTI+JUOEm4eWrRsAL4/pKehMYcfZoGiLBR0Io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JariQt5YRmeGBegqlIdVjzKOu888K4d86jUKg4Y3+CDQDAD/LjQJiY/BBz6NpTbEhzcXzyWi3lPG516g8/cXU2uUe739TLK3X86aipO7HcmpIXkRvycHn4JQX/ZQcmT5aKLSqXWVp2l5xBuyhCgkz7GI9dl+wGjzucDfpaI+Tws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfdnnqkG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE01C4AF07;
	Tue, 21 May 2024 05:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716270588;
	bh=YvXGNsBTI+JUOEm4eWrRsAL4/pKehMYcfZoGiLBR0Io=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BfdnnqkGYCCKgbd+McpaUyLD62WM5E7R9zQtM8FBte/+ZO7CfeMnvrDZGHe2Q+P/N
	 RZjsoM5gr3ScW9KCiB2chn7PI6P3P4wU+RmdqxK4Mt0rUshLMwLSUl3lVzu5c51dON
	 nToKd0rlHa4UE8/nDBrMYku9IO5dF/QRN9QCybeIxGHQa8gMy/g+Aw9OM/enLYGrYt
	 OpibF2mCU5pO6+5tTHk1XtRcf0Ljpl484Vd1a3IpTW3FZ7p1FqK5G7rsHEz7MiU9bV
	 iErpKpc96aaVuRnAPh/56eO9gK78IFiuOg7MCPhN80XFUP8M/XywY80fQf8NGZdITb
	 yO3drWUQdaurg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52449b7aa2bso1906833e87.3;
        Mon, 20 May 2024 22:49:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWH8DKvVUgdEVBg2pSKPU2Q77/bUsjuvPnnT810gzMY5DaSn7Q05KSCLU90+1uov95a6lpWsR2GC+cbNAhoEz1JhfVMjElGcHNAbg==
X-Gm-Message-State: AOJu0Yxj2u2JJhaubu2HRVg/DdX6+przjvClZ1OQTOzwufnPlDrJ8oVi
	AboujBvtyvcTmiyK89qK7SGT3Gsv2eCt3u6rWk38y0A0tewutaSCrU9tIxBrTuDK3WGFxL0UuGx
	dngFSERlO5+FYVDNHmPvSQ6mZw90=
X-Google-Smtp-Source: AGHT+IEHw6vgTn8q6c0qkt17v81lwYDZ317dZNhSCxx/bMPNWZzqqkYeK3y2b5qn+ee9592AWZcTF62WqBfG3DCUbYk=
X-Received: by 2002:a05:6512:3b08:b0:522:2c9b:63b7 with SMTP id
 2adb3069b0e04-5222c9b648bmr22414829e87.14.1716270587136; Mon, 20 May 2024
 22:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521142734.3dd04bc0@canb.auug.org.au>
In-Reply-To: <20240521142734.3dd04bc0@canb.auug.org.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 21 May 2024 14:49:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNARQ4jC=55aujEcZMdP7P4KTUDZokVjaM6ukrMHjWQA20A@mail.gmail.com>
Message-ID: <CAK7LNARQ4jC=55aujEcZMdP7P4KTUDZokVjaM6ukrMHjWQA20A@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 kbuild-current tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 1:27=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Commit
>
>   5b3d83d46584 ("kbuild: scripts/gdb: Replace missed $(srctree)/$(src) w/=
 $(src)")
>
> is missing a Signed-off-by from its committer.


Thanks, now fixed.



--=20
Best Regards
Masahiro Yamada

