Return-Path: <linux-next+bounces-249-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F55806690
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 06:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25E441C210E8
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 05:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60D2EAFD;
	Wed,  6 Dec 2023 05:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcZx+WE0"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAB71FD2
	for <linux-next@vger.kernel.org>; Wed,  6 Dec 2023 05:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F283AC433C8;
	Wed,  6 Dec 2023 05:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701840364;
	bh=mCsuqmzNCQBuIT2HaIRPP4kIonvYoG1ZmvJUL6xFUzU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BcZx+WE0P2aceV4rStln3Xjx/bKk50k9vhCCmv+F3+KXp51jRbwaQyWhkHATOk6IV
	 YsH/IevhHvfhqW+X/gGHiWmw67ycudMhgiF7voZPLd9xKpfks5fLdhcZgX2QH8zjlo
	 uTnJ0Hkhe9Fc69T5om98McaSNj/qOjDLR8biHeOJtCU/YrUqBf/JfzCe9bpH7Ha40Z
	 UtSQz/yn5oNlfeyVX8XaOEwnxXYnqPC8LeHRvo2Znx4qZWN7WijeyTfbCD2ky5nhVd
	 9wXDrqQx1L6InAwGviSfyO0Yg7JWETLfEltB/RPlAcPKhUDp99el6ugxY36tB1cTtQ
	 IQyGAJj11ppWw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50c0f6b1015so1118987e87.3;
        Tue, 05 Dec 2023 21:26:03 -0800 (PST)
X-Gm-Message-State: AOJu0YzxOy33zo1i9VDG5a1Yr0wstLJtyrwswYnTvDgnK31yUL5ekScr
	dBaRE+a2b3I9WX5aDsLHC76wfiELjMbUeRzyPn4=
X-Google-Smtp-Source: AGHT+IEwSyMRoA5jlfXhSkOQJSpXeiZHoZzfxHuEWR1zzWpUg+LFSGyGEw8giAsWSjeaInTaYK+fZfqSCPNKAPzIE9U=
X-Received: by 2002:ac2:5224:0:b0:50c:e:171e with SMTP id i4-20020ac25224000000b0050c000e171emr158833lfl.5.1701840362186;
 Tue, 05 Dec 2023 21:26:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206154730.00346f93@canb.auug.org.au>
In-Reply-To: <20231206154730.00346f93@canb.auug.org.au>
From: Shawn Guo <shawnguo@kernel.org>
Date: Wed, 6 Dec 2023 13:25:50 +0800
X-Gmail-Original-Message-ID: <CAJBJ56JJ4Dp+wcmfPcNek3XG=7WjkVZAjM4efrsC0Ha4=Th5Yw@mail.gmail.com>
Message-ID: <CAJBJ56JJ4Dp+wcmfPcNek3XG=7WjkVZAjM4efrsC0Ha4=Th5Yw@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the imx-mxs tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 12:47=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> In commit
>
>   50f8906b310e ("arm64: dts: freescale: imx8-ss-lsio: Fix #pwm-cells")
>
> Fixes tag
>
>   Fixes: a05c329644d81 ("arm64: dts: freescale: imx8-ss-lsio: add support=
 for lsio_pwm0-3")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: 23fa99b205ea ("arm64: dts: freescale: imx8-ss-lsio: add support fo=
r lsio_pwm0-3")

Fixed.  Thanks for reporting!

Shawn

