Return-Path: <linux-next+bounces-6349-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB43A97C81
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 03:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20B5A167E99
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 01:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012B5263C8A;
	Wed, 23 Apr 2025 01:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="f1eS3Hnh"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22331AB531;
	Wed, 23 Apr 2025 01:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745373057; cv=none; b=rjCq0kWa4Q+fWts09BAQy1lg1n2moGxyM1u6Jc7cpn9csyRdu1fL3XQLNROGE0Qk+SrrFdr5XqACRinMprkq5iaUsWpAUFy5nY8QQ4ihewGT8XXDZaOI0sdFVFhxshmgwAhyEu8QsQ/du7+uCfIBMAuUdWpIndmkmNXI9RJfP0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745373057; c=relaxed/simple;
	bh=6R4WwuGJQJq5HvrJ2/kuGeJvc41TbQnsdhIRQmsPQsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGGrUbNZF3ZbOHsV6ckT07m0Vn4JBdYOxjZjeLWouxZ9DHG3P6DZs74KTOgIvgxK/ZaISficdssxp+1n8/1v6Y9lEvq498JeHibCujRX7rIOeaPHVcd66/2WLTZuz2fabA7sjmwuvIMVkEpdwy8ocNhRGeCMLHdUlJMebc9As2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=f1eS3Hnh; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Fy3qz1uFkZb+AL/yG6A3s9Izi4qPXtaKdWPYBlXrJwM=; b=f1eS3HnhYf/lVfjkmlw9N00TJ3
	MoH9Q1LNu0a8MBPDdrVThATKvb9F3ej8PGzTmZwCywSuZMRnB0U0oZnaqYTesfaKYaiJIWOKfHhxB
	NVnYyWvHqs6aPv86MLRp+scFBECxCiddJF4eMilkpzCFqX2vsfS5mRsi+ozgYfsDF20doISyi8hIJ
	nfoKhQYJOen+SM5u9YThmSDsrdS+V1ViQqwy1HvKQOIQB0DOOYujy848qu5xILYfZpZ1PqhRwuroW
	RkSqxoWgrpNurt6/0WBG8IYN1thHGRUo/FA/86wTlzP+zNHimU/HCO/Wq7CNzZOr6NDIb+uqVNTHo
	Ml0BPVlQ==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PGF-00000006ipK-2Xkf;
	Wed, 23 Apr 2025 01:50:52 +0000
Message-ID: <8ba27b19-6259-49d3-a77f-84bfa39aa694@infradead.org>
Date: Tue, 22 Apr 2025 18:50:47 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 22
 (drivers/net/ethernet/broadcom/bnxt/bnxt.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>
References: <20250422210315.067239d3@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250422210315.067239d3@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/22/25 4:03 AM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next release this coming Friday.
> 
> Changes since 20250417:
> 

on x86_64:

when # CONFIG_DETECT_HUNG_TASK is not set

so CONFIG_DEFAULT_TASK_TIMEOUT is not set/defined:

../drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_hwrm_ver_get':
../drivers/net/ethernet/broadcom/bnxt/bnxt.c:10188:28: error: 'CONFIG_DEFAULT_HUNG_TASK_TIMEOUT' undeclared (first use in this function)
10188 |             max_tmo_secs > CONFIG_DEFAULT_HUNG_TASK_TIMEOUT) {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



-- 
~Randy


