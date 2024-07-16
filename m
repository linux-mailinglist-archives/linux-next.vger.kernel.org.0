Return-Path: <linux-next+bounces-3037-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E96793270D
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 15:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09A92281D5C
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 13:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB1517B431;
	Tue, 16 Jul 2024 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A10C7KSp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB24145345;
	Tue, 16 Jul 2024 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721135055; cv=none; b=Nyea7TifoWBX8Tm1z8Dsm2RxnH/J6x/vERKW/Tl6BWLAaLerjV3xbBSeTSPqSYKQill6Bn22r1HKlObPbbXoOl1JBuMgr4xM4kmNg6wJLVgSfvZLqp0SxMTIrgXKWNQnP72AtHGE2UBO+l8ETNJMC3zxS7Oq6557L8YJw/W2pe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721135055; c=relaxed/simple;
	bh=ADoip6J5D1G99qQireSR42pwpE3m8ZZLPoi2Gwk0GpE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rfnXrr5kpyZQeDLPVBIGrIFIVtF7Uwe+d6WAwKimb9rSwwGrH6Jp0o/NZBN+Oqg8pCpwjjBCCJOa1yDNrYRlj/CaTAN59cXu0o5s2aOnw1LqGcPDUf5YDGZ3HkxvVl2yKolbYvxlH8CxyZZmDQ5l6KIXNAC2J8unShnPJ8hwx7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A10C7KSp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05B6C116B1;
	Tue, 16 Jul 2024 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721135055;
	bh=ADoip6J5D1G99qQireSR42pwpE3m8ZZLPoi2Gwk0GpE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A10C7KSpUBzGPg89rkbA7AKYznl0V3VHvqteuGSdOCC6AG7k+7C3rJHduMSunwXV5
	 ffaAH2Z4Bn0Ms8TTTvtzqrgLaaxdUfpji5GhAcBg+aNexcqz/8kvtxNAwdBpApOPLV
	 DzuBM5z22tfgz0uQHIFL+VXuhsLmE+SodaDz/ombRMb+tLVPoVrQqCJm+y4XmLXK4a
	 ODVoAo3TNdhmY1AcC2Ol0zC/CnoX+Is5o5G/mt0j5Stzh2N0pEKRhfHUaiAK4rbqfj
	 eh2t8kRYWGSsLI1IN4YhzsiL5o+fkevHSuwihU/zS0ERPL6gxd21jmLDwGnqK8tdw1
	 4HmoMICA3RtKQ==
Date: Tue, 16 Jul 2024 06:04:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Saeed Mahameed
 <saeedm@nvidia.com>, Shay Drory <shayd@nvidia.com>
Cc: David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the net-next tree
Message-ID: <20240716060413.699a9729@kernel.org>
In-Reply-To: <20240716165435.22b8bfa5@canb.auug.org.au>
References: <20240716165435.22b8bfa5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Jul 2024 16:54:35 +1000 Stephen Rothwell wrote:
> include/linux/auxiliary_bus.h:150: warning: Function parameter or struct member 'sysfs' not described in 'auxiliary_device'
> include/linux/auxiliary_bus.h:150: warning: Excess struct member 'irqs' description in 'auxiliary_device'
> include/linux/auxiliary_bus.h:150: warning: Excess struct member 'lock' description in 'auxiliary_device'
> include/linux/auxiliary_bus.h:150: warning: Excess struct member 'irq_dir_exists' description in 'auxiliary_device'

Shay, Saeed, could you send a fix for this real quick?

