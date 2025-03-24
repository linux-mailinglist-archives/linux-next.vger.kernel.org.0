Return-Path: <linux-next+bounces-5988-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C51D7A6E6C4
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 23:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 739AA7A5D05
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 22:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D157D1EFFA2;
	Mon, 24 Mar 2025 22:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iZhstfqn"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F17C1EF368;
	Mon, 24 Mar 2025 22:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742856412; cv=none; b=DkaNvcP83/3PrqX68Z4O+gfwK3fxzUyq7Y95E6uRPBG5jdB/pCUU8JVMGwRlDQbnnQ+PMTlTYrLC9txJzm3+tYvizNzKm0/TP5MC0cfqfrLsruQWubiukPmppUd66deJCBY4VkZv2ku2rbw1CTM8n4FsZGaa5wIB5oGCdx6kSDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742856412; c=relaxed/simple;
	bh=RrIyOfXD0GJNcypng7Wh9WiSWTk5eKrBUjsfZTrr0NE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUMql2O7vBVluHgESrERmi0pHMlelI2N1LPno6lqwyaLmrkOZl1arsLXPqLwS/QqM6HdvCv2M+PmG+37UwqLu2vrQ2Sx5DbPPh5IqQ0xbVuqvBy86Mq+hS9Zpf+wLwfi05e3xbTYt1Kk2gjs6gA3lqBKDCdDEDGWoLLoqWhUmIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iZhstfqn; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8ZmTbketZ54QzeXCl26c7EEbeq37wz1sgZSmUcG15uI=; b=iZhstfqnCuvnLFoT9bPcLs3/u6
	ut/w2MtVGTo0F6T/umLB/1+ZIGMm93mM5OZeh/ttjOBtBDDftP8Jc+rguMdeKV5Xz8nJiUjMDdpvt
	wB43MG5f/xdjYGjrdSdwRUr4QVjECpYR+bLTjiaZJ4SDU9KdfU2pmsXsI0a57ovJE1O82dHAZj6Ya
	hdrn34MROSl/vvQEMajxxMXm4rQ07pSQgBdEvGwtWNF/vh1X8/AqYkedvof6pTCAQujVYRs4v40vz
	5cx1bPMBQ5VPBNNiTi+iCjK4CWFqmEa/COK4s7tMuYLvqmIMrj2kkfyFkoqPFIhQM9/eBSV7sRPU0
	6X6GBUcg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1twqZC-00000005Jfx-1c0u;
	Mon, 24 Mar 2025 22:46:47 +0000
Message-ID: <90eb07a0-1490-40af-9858-d357b922bbb8@infradead.org>
Date: Mon, 24 Mar 2025 15:46:42 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Mar 24 (drm/xe/xe_migrate)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250324230122.106602ef@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250324230122.106602ef@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/24/25 5:01 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250321:
> 

on i386:

linux-next-20250324/X32/drivers/gpu/drm/xe/xe_migrate.c:1561:(.text+0x3074): undefined reference to `__udivdi3'


-- 
~Randy


