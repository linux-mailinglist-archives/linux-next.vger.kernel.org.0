Return-Path: <linux-next+bounces-5529-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C090A3F0C8
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 10:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C683C19C79DD
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 09:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D3820C497;
	Fri, 21 Feb 2025 09:40:30 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA062040B0;
	Fri, 21 Feb 2025 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130830; cv=none; b=lbrcW2kTdr0v8iljK2lCGYh5GQFE8SP0AzxP7wedxSQq+vRAiiYrg/eeocmUjyml9K1OzFk8tA2A+li5pdOoqI/x5pyCMgHLX7ei44IeUnyxeoFu3BdhrTEAYuJFwaPZC//zgIN64HXt0dY59qqKUIOeeO/ciDTuytmDBvOGEus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130830; c=relaxed/simple;
	bh=tR31YKkCIF6OEIJ7x6IHgNoxRksDGG4qcBAMc7iNozs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VVMDdplMvZpYnB1Udl0C2BG5dBdEusIGUI5lEDZx3OWeyqcQcxSY9KOIzId87sajZgacJLHVNRWLyLwvcJ0hO88Tu6GPq4eeE7H+AktmR3meZKRfdIVBpzupolbG5tPo/P7lNQxcbjiJjX5FRjlpJ+Dt8dXWwG1S4Ic9qRxZH3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD03C4CED6;
	Fri, 21 Feb 2025 09:40:26 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sudeep.holla@arm.com,
	will@kernel.org,
	sfr@canb.auug.org.au,
	Beata Michalska <beata.michalska@arm.com>
Cc: ionela.voinescu@arm.com,
	yury.norov@gmail.com,
	linux-next@vger.kernel.org,
	sumitg@nvidia.com,
	yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com,
	zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com
Subject: Re: [PATCH v2] arm64: Utilize for_each_cpu_wrap for reference lookup
Date: Fri, 21 Feb 2025 09:40:24 +0000
Message-Id: <174013080894.2262863.4824734189364820879.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250220091015.2319901-1-beata.michalska@arm.com>
References: <20250220091015.2319901-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 20 Feb 2025 09:10:15 +0000, Beata Michalska wrote:
> While searching for a reference CPU within a given policy,
> arch_freq_get_on_cpu relies on cpumask_next_wrap to iterate over
> all available CPUs and to ensure each is verified only once.
> Recent changes to cpumask_next_wrap will handle the latter no more,
> so switching to for_each_cpu_wrap, which  preserves expected behavior
> while ensuring compatibility with the updates.
> Not to mention that when iterating over each CPU, using a dedicated
> iterator is preferable to an open-coded loop.
> 
> [...]

Applied to arm64 (for-next/amuv1-avg-freq), thanks!

[1/1] arm64: Utilize for_each_cpu_wrap for reference lookup
      https://git.kernel.org/arm64/c/20711efa91e8

-- 
Catalin


