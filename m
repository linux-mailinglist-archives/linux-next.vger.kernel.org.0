Return-Path: <linux-next+bounces-8233-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D74B48C14
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 13:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86D6E3B1553
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 11:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E8E22836C;
	Mon,  8 Sep 2025 11:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="BHl7nfJ2"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CCA219A79;
	Mon,  8 Sep 2025 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757330792; cv=pass; b=UDmTcB7FZFhha7uOiqCwX2RxuEnMBlXKor/WCqogva5wOJoTP1FyOZVnGePyLFkRvgeg+E+aT6DtgK+zgsYf1+0qTEclC8ddqFKHiWUpn89FCI1B1EZuFmW7o6P51hsHU6sBMjXWqKx4lpLHEbIM4oEVpUyMcS39rK2S7mM8Qqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757330792; c=relaxed/simple;
	bh=eVbCFAA3x9bibq1+I1Mxq/CvQ5L+I6BZnkIAmHs91lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oLRt7i4V+LBsHr6J6p3XMlrPe6F6BizqNW+6UuLrQ7yo9Qussr8Qwbkegl/awJG4qelPKla1Ltig6gKk98qQAVZNflNci41N6+QR3h/i4bWUttRxkSnYeKKBAfsRrVRuDwbOPYNLAlKRV7PelShlWFxo9+3BYzsJw4XaclBcAwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=BHl7nfJ2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757330782; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F1rq2h03KpgOj+V7/RWl/A02tG7qtK9GYkcnLnt6npumcC9kQwGaKgkw8ZhacGyBFAPknzYtQnCO1QqEqq7afE5s5KA1T67dROBAIwbqfzVjcLEk2JY7vStpyNfvusjJVTg7QhSRZkfRUmd5crXMZvziNyhMfkflMo6n5jVlkTw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757330782; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UPVKRFnnfsp9Ohqw9fZz0rFjX14hrxM8s5ZBYf7ggUU=; 
	b=DW/z/0mDvfQrCu419ND4MTf9BI3YmgWvkBzV0VF6JuKKE7U7yzASZy0YEcVLFLRN3ZRPygqG1Ab9kZrKLtKCBUjOtXarVWjZA3WFFD5OBGkPNvZqKRPTaNG7xs/D1qEd5w7bI2xBqVLM0rAQznVOIdeOboa48quEocY834WRLCY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757330782;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=UPVKRFnnfsp9Ohqw9fZz0rFjX14hrxM8s5ZBYf7ggUU=;
	b=BHl7nfJ2xLrm89YCrl1JIbHlL4xoCX+ewdREZs9WS03XKHiQ+FFrP9kw2swuPqH/
	29WdAPNJwfYCAVarYvVlsM3iiGBIZF/e8qCbcdIHn7aWr1bSGu61AFx9b4OmH1WaAT3
	v9M7vSIY0s55K3qNPQPPzqIJ6ouZgWaeZRXbP2M4=
Received: by mx.zohomail.com with SMTPS id 1757330781655602.410704399152;
	Mon, 8 Sep 2025 04:26:21 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Yury Norov <yury.norov@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bitmap tree with the devfreq tree
Date: Mon, 08 Sep 2025 13:26:18 +0200
Message-ID: <5937399.DvuYhMxLoT@workhorse>
In-Reply-To: <20250908175135.4215c780@canb.auug.org.au>
References: <20250908175135.4215c780@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 8 September 2025 09:51:35 Central European Summer Time Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the bitmap tree got a conflict in:
> 
>   drivers/devfreq/event/rockchip-dfi.c
> 
> between commit:
> 
>   7d9e29ed3f8e ("PM / devfreq: rockchip-dfi: add support for LPDDR5")
> 
> from the devfreq tree and commit:
> 
>   414054a0bc1f ("PM / devfreq: rockchip-dfi: switch to FIELD_PREP_WM16 macro")
> 
> from the bitmap tree.

Yeah, basically both of these were by me and landed at the same time
through different trees; they were developed at different times and
the reviews just happened to conclude at the same moment. The reason
why they go through different trees is that the bitmap changes are
part of a large refactor across several drivers to make them use a
shared macro instead of reinventing their own, whereas the devfreq
side of the changes is functional changes to add LPDDR5 support and
also fix the cycle count on RK3588.

> 
> I have no idea how to fix this up, so I dropped the changes from the
> bitmap tree for today.  Someone should supply me with the appropriate
> resolution.
> 

Dropping the bitmap tree changes of this driver is fine by me. I can
send a rebased patch of that for the next merge window to do the move
from the driver's own macro to the shared macro. The functional
change in the devfreq tree is more important to get in.

Kind regards,
Nicolas Frattaroli



