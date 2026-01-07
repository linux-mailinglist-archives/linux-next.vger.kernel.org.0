Return-Path: <linux-next+bounces-9578-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7554ECFD80D
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 12:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A64330B88C6
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 11:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54C6301016;
	Wed,  7 Jan 2026 11:50:03 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9839311959;
	Wed,  7 Jan 2026 11:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786603; cv=none; b=rBsiJhFRjV82gsPQwvtrvomEcoWBLoz/jlpsDeosxhhp3AMnFmNJJlhU4LJ3Kp5EB8mLZHy5igdb0cs5P0XweZYbCdjO8hPjZ5S+ogK8fhhVed6Fx8rhhKrOrc3J0GURe+XeGHhK2beaAnbLmZMu8MhBpvftjov7V6Bp/JSlgLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786603; c=relaxed/simple;
	bh=wATONDxLHCzWsQ3lCE6o6t5ASIiyiO75Mazihbb+//w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DH7My48F2y+yV1mi0jiKGgN5uld641zpgge7hGmak6+BzZ5v/ccjVoCSqrUSOoPoWUkSRmCqtRifjHJXuidKIowNk8vYXYueBH88f9BGE0jbRHrYsC6n9iiZk1sMJFScIMSIFisQZ69WR9llGv+0/DzbZetU5XbcgnOu2FhLA9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED01F497;
	Wed,  7 Jan 2026 03:49:52 -0800 (PST)
Received: from [10.1.35.30] (Suzukis-MBP.cambridge.arm.com [10.1.35.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5DAE3F5A1;
	Wed,  7 Jan 2026 03:49:58 -0800 (PST)
Message-ID: <58882162-f62e-455d-973a-7efed2513658@arm.com>
Date: Wed, 7 Jan 2026 11:49:56 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the coresight tree
Content-Language: en-GB
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, Tao Zhang
 <tao.zhang@oss.qualcomm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20260106114933.638b073f@canb.auug.org.au>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260106114933.638b073f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stephen

On 06/01/2026 00:49, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the coresight tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda:45: ERROR: Unexpected indentation. [docutils]
> 
> Introduced by commit
> 
>    33f04ead7c49 ("coresight: tpda: add logic to configure TPDA_SYNCR register")

Thanks for the report, I have fixed it here :

https://git.kernel.org/coresight/c/98baf887b1e9a

Suzuki

