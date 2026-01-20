Return-Path: <linux-next+bounces-9737-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9875BD3C476
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 11:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E60A85CA582
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 09:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A92F39A805;
	Tue, 20 Jan 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAQEnMSg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6077134847B;
	Tue, 20 Jan 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901345; cv=none; b=MZtg7NqFLBl3dV0PL/qJhgf+ocWrLpOndboyzV6tp3oZham/VWBb6gQYRSwciFoY0Vik9bH1jY4G3qf7YPkABe0r1gZ0/dklTTm/0/nSR7OHPr2a/cknmcalt9ksEchfCuGgy/cdK8Ila/545ifgdIoxO3aGshS/ieL8qXahQxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901345; c=relaxed/simple;
	bh=uej1CiIoXBIfJShNq7bpoCYGkjlemjo7/C4thrxh3ug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VZsavAwrUpOoVBsO8J3VadQ8EnJzrT8+NXM/8aG/lpKKHp8lDu+bJmCvEK7ZM1/4Lsu6nNUbkSSwMzv8boOFhY589uabsbDocp/vGHMy38YlPiLkMLVKuFGZhPeo+8i90A30nPHFXgvLwsC3Vi4vGTdbkBAKjzZNdlHoMB6vrqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAQEnMSg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFB1C16AAE;
	Tue, 20 Jan 2026 09:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768901344;
	bh=uej1CiIoXBIfJShNq7bpoCYGkjlemjo7/C4thrxh3ug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VAQEnMSgSvbR+9OvFhXYJDf+TlxDvomU91wzaY5Gi+VZFmQtjEcuKySTaF0JIU0eW
	 +fBKWWc6Imp3Ykr1GhoYkuL9sQ1vnPwfYoDu6pWrLLlD/or2kG/YBn4LaznAXVWvcN
	 bHxriqUOBwirnJM1iKOFl2DXSfIZ2LuM1RyTR+yLYfR/j7YgP/lNN3hqBoAS+OHapI
	 glo8R6ebHCzvvrfSkfQOiX2OP6mTMz8VWQsuN3L8DXgvRfNiW9IHRjPjVf9vIkRyTI
	 1e7xWq6jGYJ8HMXLzpGEKLhbtK+eJtX881usrfr6Vpw5+adg3QH5a5DT41KqHJOsnq
	 oc8NCKJ49ZKNg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>, Tamir
 Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
In-Reply-To: <7481981a-1441-40cf-9924-de1466a9f33b@kernel.dk>
References: <aW5xqLq7gatOy1DV@sirena.org.uk>
 <AUJCMNBUg3qSjldH9SHrWsNs5Xg9zAm0Jdq_qlXbcVcyxFnJMFkzTicAmDlaQpvQ-mC4jmGovePldoNa0G2khQ==@protonmail.internalid>
 <7481981a-1441-40cf-9924-de1466a9f33b@kernel.dk>
Date: Tue, 20 Jan 2026 10:28:56 +0100
Message-ID: <87y0lsoco7.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Jens Axboe" <axboe@kernel.dk> writes:
Hi Mark,

> On 1/19/26 11:02 AM, Mark Brown wrote:
>> Hi all,
>>
>> After merging the block tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> error: unused import: `c_str`
>>  --> /tmp/next/build/drivers/block/rnull/configfs.rs:6:5
>>   |
>> 6 |     c_str,
>>   |     ^^^^^
>>   |
>>   = note: `-D unused-imports` implied by `-D warnings`
>>   = help: to override `-D warnings` add `#[allow(unused_imports)]`
>>
>> error: aborting due to 1 previous error
>>
>> Caused by commit
>>
>>   4cef2fcda3ada (rnull: replace `kernel::c_str!` with C-Strings)
>>
>> I have used the version from 20260116 instead.
>
> Adding Andreas too. This is a bit annoying as other stuff in the
> block/io_uring tree would be nice to get exposed...
>

I am not sure how I missed that.

Can you apply the following as resolution when merging the block tree?

diff --git a/drivers/block/rnull/configfs.rs b/drivers/block/rnull/configfs.rs
index 2f5a7da03af5d..bfe998d31eb95 100644
--- a/drivers/block/rnull/configfs.rs
+++ b/drivers/block/rnull/configfs.rs
@@ -3,7 +3,6 @@
 use super::{NullBlkDevice, THIS_MODULE};
 use kernel::{
     block::mq::gen_disk::{GenDisk, GenDiskBuilder},
-    c_str,
     configfs::{self, AttributeOperations},
     configfs_attrs,
     fmt::{self, Write as _},


Best regards,
Andreas Hindborg



