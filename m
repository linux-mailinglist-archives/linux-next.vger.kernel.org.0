Return-Path: <linux-next+bounces-589-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1613822722
	for <lists+linux-next@lfdr.de>; Wed,  3 Jan 2024 03:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 521B01C21BDF
	for <lists+linux-next@lfdr.de>; Wed,  3 Jan 2024 02:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87181798C;
	Wed,  3 Jan 2024 02:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="PHborYsU"
X-Original-To: linux-next@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020F517988;
	Wed,  3 Jan 2024 02:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from [192.168.0.22] (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id C06F0A0F7;
	Tue,  2 Jan 2024 18:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1704249756; bh=zAL8GnuuzNwuWcn0s32NpfVCCNajJ/DkFytPpE1ALFU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PHborYsUEhuehfWwQlgNkaMGtHmlMGHkl6T5PPEe8y2F3aX0vKYsal3lkq9yAC7nn
	 whK3XEsbIX7B2YnJGfn7d9aDgPNq9IArxFRJteEsqIYm6JLL4qc4e6+QagXIPX54dg
	 93wmJzOZ2Ry/clxu8ebgK9ri6IWktCrzNID5KiWFfJbvUKvB2hHTt/39mb0vEj/ddl
	 oa6KlH+bcFgSHnD3BjSApt7C5V+eIB/qKRXMjsu365PxXuFHnJ80zPEMGXNvWhEloy
	 kHlPfQnLgYflbbpiCJjFTqJH7EMF23PSboP8pN+C2OgEbCEf+z8r1ch/2COwv9tJcw
	 GrrFKalS8MWxg==
Message-ID: <566656e5-36fc-4841-9317-d6c2e87e2a48@endrift.com>
Date: Tue, 2 Jan 2024 18:42:34 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the hid tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240103083208.03071ea8@canb.auug.org.au>
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <20240103083208.03071ea8@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Sorry about that, I must have forgotten to add it. Can I sign off on it now?

Signed-off-by: Vicki Pfau <vi@endrift.com>

On 1/2/24 13:32, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   917972636e82 ("HID: hid-steam: Disable watchdog instead of using a heartbeat")
> 
> is missing a Signed-off-by from its author.
> 

