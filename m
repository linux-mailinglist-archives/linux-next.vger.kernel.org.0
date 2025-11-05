Return-Path: <linux-next+bounces-8857-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D167CC386BE
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 00:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4D653B3EA8
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 23:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73C72F3C3F;
	Wed,  5 Nov 2025 23:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaUlGxBN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9125B2F3C09
	for <linux-next@vger.kernel.org>; Wed,  5 Nov 2025 23:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762386868; cv=none; b=sgo3m7OPJy4WskO2O6SYoBMH3qTiC/WBMR/TqjNbbXWziTZbdOJmYkdXQDJczMuSJx6y/EmTOXiWZ4yf+BqRstMd5tkEttXfnMk7KuClC6ALSTOn47wvTs7GJQ2oJ9dwVfZFJs50NOK0OQKGm9ZoqAjErKYOGo16qxmCpuhV57k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762386868; c=relaxed/simple;
	bh=0JrdArxjppgXWbB9b0LpkopP+yu3WU3K3d/AEk/KiT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTlyQDeWiCZ+L3AlHRwJVsLswVhM4l5Zg0iZOKUTNwF2qN1SDFGNUUODo9fvMH7JBnPkt/IYKcfBoK7YwUCDgbGmMX1jRl24lIW4f628FDiXsia4q/nsmodubN18HXbshFCx0O31YDb64d2EqPrNNPEj3KpadTzobDctiJziy/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaUlGxBN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD4DC4CEFB
	for <linux-next@vger.kernel.org>; Wed,  5 Nov 2025 23:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762386868;
	bh=0JrdArxjppgXWbB9b0LpkopP+yu3WU3K3d/AEk/KiT8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DaUlGxBNyCMBuoP4EpB/m2QGlIQapxe3jBYAUNeCPBjpyYAokjY+4hd/AdN1ntpUf
	 ojRc6ecZhXBl6Mtt635a+f2YLxV7eij0d1w74PzyEdR2K78aYnyzG8Hoc04xL5N3Z6
	 ux8V0FPYTVXWDha9JWzBOtCAbapfslRuE05fKKVPBm1+5eEGe8bZBOy9Wgdbgn8eiZ
	 jIy8wlzjQrtpGfSrRqHj0bZlzIgwGD+suASY184aE7GgEUoPi07K0wiHk8kI3kWZF8
	 XB6VTknbjvnROZvx1vK/fuhrBDf2mv7vhKh93Q1rquLOyqRn0LEkSH5jZB34qCxrw6
	 8lqViVJkkqa/Q==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so497103a12.2
        for <linux-next@vger.kernel.org>; Wed, 05 Nov 2025 15:54:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWM2TFC28eKe1TqXqX05QaRM3zPGi2VK6mr/yps1l4KNCbg0msUkTrCFe+/BHArKtUQBkbb2yZezH4x@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4+kPdBYzihMGwDXXZYjikxZtaLlSaqM9QKzPz6Uq4nVQ6wUBc
	i0/sMP+G7zERZ4eq+mQ49nP+EFS4/AVVQLol9SwhdGd1kQx6ucGRD6V6fbxKOcawl8UQgwvh3gd
	ygWGyRJjpscQITCPDYNLVeDbbTTGMgB8=
X-Google-Smtp-Source: AGHT+IF+SbDqKedSslrWm8uMQYYqZy4ZQlhrBwFAts+++xikLYbWpJnK70RqmKfn5RSkkNZJ2cT9KekHmwayIlqPnCo=
X-Received: by 2002:a17:907:720d:b0:b3c:a161:683b with SMTP id
 a640c23a62f3a-b72655ee4a9mr516765666b.60.1762386867031; Wed, 05 Nov 2025
 15:54:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106101257.6e9b46f5@canb.auug.org.au>
In-Reply-To: <20251106101257.6e9b46f5@canb.auug.org.au>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 6 Nov 2025 08:54:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9Au1LoZjjx07TFm0E6GbfXZ_UFp+pyQT7J_GO-L5joDA@mail.gmail.com>
X-Gm-Features: AWmQ_bkXYm64qfCJeQd08vujSBeJ3WmgbPBEyzsDWan02D7j4kDzfaRMljYozQs
Message-ID: <CAKYAXd9Au1LoZjjx07TFm0E6GbfXZ_UFp+pyQT7J_GO-L5joDA@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the exfat tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 8:13=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
Hi Stephen,
>
> The following commit is also in the vfs-brauner-fixes tree as a different
> commit (but the same patch):
>
>   772a65ec60d5 ("exfat: check return value of sb_min_blocksize in exfat_r=
ead_boot_sector")
I have removed it in my tree.
>
> This is commit
>
>   f2c1f631630e ("exfat: check return value of sb_min_blocksize in exfat_r=
ead_boot_sector")
>
> in the vfs-brauner-fixes tree.
Christian, Please add my acked-by tag to this patch.
Acked-by: Namjae Jeon <linkinjeon@kernel.org>

Thanks!
>
> --
> Cheers,
> Stephen Rothwell

