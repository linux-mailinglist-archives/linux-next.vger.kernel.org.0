Return-Path: <linux-next+bounces-6941-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBBDAC5A4F
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 20:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 931E21BC070A
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 18:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33CB280032;
	Tue, 27 May 2025 18:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="enHxrF7u"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5191CAA6C;
	Tue, 27 May 2025 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748372215; cv=none; b=DGO7mlqvGca2HGSnN+HwvtQoS4Oo7NktuSJqrqrhVJ23l7eR6/aaBOD7EbIGW8+vY4PaeWN4jqJ7FnPpSc+rl2c3zE8HAqJq4dJGbHHgopOME6GXsk2dyG7du9brmd/jd08OJNqTla1TamzbU4ivag5cc+7sD/SndacQNiiLSVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748372215; c=relaxed/simple;
	bh=Kt8hkX+NOPAFYRRZ6dPid588poe6O6S4SmENjGduciw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=okpXTOTFk09Inyfb4pohIvDsVmVYk51OcqNcN32M/ob5iv1DscttUaC+dFaNngZISjTtoUfeUj/PrASb52sOQuBsigh5gqVmcX2e1WF1i90oSFDlRUUugl2TMhtw5q+UwO1zJ8ZQ8wuksJQoQNmI+uDkzy7XACn2nGM4MXyoPbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=enHxrF7u; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Pb4HbvNRtURyWEvutH1i+CzUZEMMh0LESQbc8k3392o=; b=enHxrF7uEtbtabCB14gJloa3oC
	YOpcz05+IPBUmTEjtm71S1S9k1l1RHbJNuFnWcf2xP4m8MOZoYggOY1ibY+gXKlRg1Vfn2H6PD6vj
	eCHNXdkhKKrXxVny1FCdARigBW74ARx8mX4qrNCSaljaMW4PMnuPndwFwISjG2eJTR7PEuufzRB/Z
	kvj3N9ASMzHtOQGY7XGE9EuyihM46dyuAYJyBIIyqk/o1ccu5TrLqvnxUSen/lmbV/k/z2ufC8MBg
	dOMoMT+QPbVnU4xEhwoSM1WiYMhpslwumtAB5UE+FrzBtVnVdugnsHX8uKZtQzHCQYTwEGUDq4M+G
	6WwQBwqQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzTl-0000000Cl5K-2m6Z;
	Tue, 27 May 2025 18:56:49 +0000
Message-ID: <04577a46-9add-420c-b181-29bad582026d@infradead.org>
Date: Tue, 27 May 2025 11:56:45 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 27 (drivers/platform/x86/amd/amd_isp4.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER"
 <platform-driver-x86@vger.kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250527203231.3c6c0b9d@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250527203231.3c6c0b9d@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/27/25 3:32 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250526:
> 

on x86_64, when
# CONFIG_MODULES is not set

../drivers/platform/x86/amd/amd_isp4.c: In function 'is_isp_i2c_adapter':
../drivers/platform/x86/amd/amd_isp4.c:154:35: error: invalid use of undefined type 'struct module'
  154 |         return !strcmp(adap->owner->name, "i2c_designware_amdisp");
      |                                   ^~


-- 
~Randy


