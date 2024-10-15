Return-Path: <linux-next+bounces-4271-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C90599F025
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 16:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E621F2819D9
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 14:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F20E1C4A24;
	Tue, 15 Oct 2024 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGKC7Fha"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95881B21A9;
	Tue, 15 Oct 2024 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729003898; cv=none; b=C2O27Ry3ufNyF1I1GDWdzhUopSBDjg+GzRokUVwUmbUBCKkIHKFjaJuQwbvGX2FX5jNXTCUosivHagM9BOekbgEoZg+p9TZ+PKkVsr756m836pmK0b/HglhmSDS6FSpPe291vG8cfskJxUgTMvAWRJ4GFhRjL+EjDL6Jpp8Dg9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729003898; c=relaxed/simple;
	bh=YQHSY9AN8O1RQP1NhpxBl1Ry2Sc9D2DLqRRMCMqpuIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtxHM3gPuJLMZDJjD5/QePV1PAUk+Zy0aLaYN3yFW8QrMqq7YrGZD0zgx3w/UY3GiSsq1zQ9nHyWAl4sRIWYVznzNZKe7VnzJwII1uAo/rHmiCKl1Gzafl3FcDsyepxogcKAtGcEk1m7vdY/RjQo4rjVzNoaPcdPT/YeSYiWVCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGKC7Fha; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5867DC4CEC6;
	Tue, 15 Oct 2024 14:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729003898;
	bh=YQHSY9AN8O1RQP1NhpxBl1Ry2Sc9D2DLqRRMCMqpuIY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bGKC7FhazJld3PWPtrYBY6Mw5dCeWt0EpA983RIcfYjiAW8n8JMSTK3rIVHHMuesQ
	 qEzpu+aIC+QzmT/qWY0koaQk3IAX5koGoovwre379nDx4Msmm4iMIfXHQy0f01tFSz
	 NV84IPgWK+arutyDBoryPyjMe6fbDIlvRPQG23Joj997zxe4m3HCZlox0iKOOEOyHT
	 0hzdd4vOABRUeUDx4mhDGhVm/hzAd1kBUuLyDbszzOKqGJdKLYqVuwmL5LyCoLwfCE
	 1KJmiDCZgqdGWk2rkVKkL40BG2JurLtdphJOGj2nL8ZhPyB/CcDZjbW4DQ9mZe7b9s
	 OsPgL4E1dd2JA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f72c913aso2543083e87.1;
        Tue, 15 Oct 2024 07:51:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWElYjFvHtk7MCpzf5LrbGywl5nlKQiNhCDnxPJFnM2Gnh5sOfFo0BM5MMNlfLapBMaVh22k2cPkVlu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ycYkj0Ng6XYttE+A6eUyaowAohPqHgqDbzpMTkx1Hrr+qtzb
	skE/+KIHg1fMmRCdio6oFI0n5/PQeG9jJar3r3QmzNBeB+Vxokl7A1lPXe9A5Wyw8HCmsUSgbBt
	/hDVu5Rfjq9j2FzgYoAOwmKX6Vg==
X-Google-Smtp-Source: AGHT+IGCVsSYZe2XPgtmyAoF6cvPSHVASVcNcEaxEV50+uL1FqcGxNzdn21vcYStjBFX3X3i33kdTtmDBOD+4T5VI8A=
X-Received: by 2002:a05:6512:e88:b0:539:e60a:6dd0 with SMTP id
 2adb3069b0e04-53a03f91042mr534113e87.51.1729003896735; Tue, 15 Oct 2024
 07:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015164453.09845d09@canb.auug.org.au>
In-Reply-To: <20241015164453.09845d09@canb.auug.org.au>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Oct 2024 09:51:24 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+84Ara9+pk=HnZvxA+a2f1OfthSz5dy7zWY5F09feCNQ@mail.gmail.com>
Message-ID: <CAL_Jsq+84Ara9+pk=HnZvxA+a2f1OfthSz5dy7zWY5F09feCNQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the devicetree tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 12:45=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> After merging the devicetree tree, today's linux-next build (powerpc
> allnoconfig) produced this warning:
>
> drivers/of/address.c: In function 'of_pci_range_to_resource':
> drivers/of/address.c:244:45: warning: passing argument 1 of 'pci_register=
_io_range' discards 'const' qualifier from pointer target type [-Wdiscarded=
-qualifiers]
>   244 |                 err =3D pci_register_io_range(&np->fwnode, range-=
>cpu_addr,
>       |                                             ^~~~~~~~~~~
> In file included from drivers/of/address.c:12:
> include/linux/pci.h:2022:63: note: expected 'struct fwnode_handle *' but =
argument is of type 'const struct fwnode_handle *'
>  2022 | static inline int pci_register_io_range(struct fwnode_handle *fwn=
ode,
>       |                                         ~~~~~~~~~~~~~~~~~~~~~~^~~=
~~~
>
> Introduced by commit
>
>   1957da25d023 ("of: Constify struct device_node function arguments")

Missed the static inline. Now fixed up. Thanks.

Rob

