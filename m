Return-Path: <linux-next+bounces-4332-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 869D89A497A
	for <lists+linux-next@lfdr.de>; Sat, 19 Oct 2024 00:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47E21283EA0
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2024 22:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5025418D65E;
	Fri, 18 Oct 2024 22:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBrWYPS6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2658A18CC13
	for <linux-next@vger.kernel.org>; Fri, 18 Oct 2024 22:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729289338; cv=none; b=fvpaFSOdTMDNwEY9vy180jL24Zuu/wz0iepEgVtABipgFlCg5IlTOohNHmQDI85qnfmUGRRKzjGWirwZT66svqd+FjaDB6T6GQ6S5o0I/cf8rF3bnRLv/ZRnCGmKY3sX+FUMd/1HbycjVNhSv+Jy2S41cWS4UHmjYZxmYJzlRoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729289338; c=relaxed/simple;
	bh=WO9uNNvcKhmL9HpSdSQQOTCh90RBWrEZisFIW5qrw5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHj5xVFb8EWfHuWf53Jk8dCLmOM0htzpUsjaHoNG2AcGmvGROJuNB0nLjM2v9M7afeG7X51H2bJydY9XrjW83oajTCYbXituedTDPdY900ZATrQ/qrQQEc2x486HBy5wZJAfzBGSCGuGqGS/Bvzblccpr/t3p8MPE6rzKsvKjg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBrWYPS6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F7EC4CEC3;
	Fri, 18 Oct 2024 22:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729289337;
	bh=WO9uNNvcKhmL9HpSdSQQOTCh90RBWrEZisFIW5qrw5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bBrWYPS6Q/fDkW3xINigUSpP2JZspnNTir+lD/fjTbOv6Ebpzw3EspBGr9u12rQdj
	 7SpCq+sq5FE3l7wiPTO1fVqj7uPBV+lft1CIYgx7NcuLp1dvqGgwQdjpmEPzKEzfGQ
	 6SLr0yTf3YuXDgdvCqXg+UM51VriabfDCNQ/TH0qMJjebmDuBy/nsneWWu64E0anxb
	 bIoYWhpJAbFwuFgZdm6AoC2mWhf87EPJzefyjTYqw4QbiHTfVbgcGHr8bivdP9w3ZR
	 it+qMbvMrisma7QrZsw+5W6RI/RgvIToqjL/GFutU4odmeLXOdOdqHGe9aMxNiK9hW
	 YaOM2V00TLwjA==
Message-ID: <e6729d57-85d9-456a-8f63-3cd5be11b512@kernel.org>
Date: Fri, 18 Oct 2024 15:08:56 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Please add ipe tree for testing
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org
References: <991f7b99-25fa-426a-99b1-a161fef3b728@linux.microsoft.com>
 <20241004144539.1adeae43@canb.auug.org.au>
Content-Language: en-US
From: Fan Wu <wufan@kernel.org>
In-Reply-To: <20241004144539.1adeae43@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stephen,


Please update ipe's url to

https://git.kernel.org/pub/scm/linux/kernel/git/wufan/ipe.git/ #next

Also please contact me by my kernel.org email for any issue in the future.

Thanks you.


-Fan


On 2024/10/3 21:45, Stephen Rothwell wrote:
> Hi Fan,
>
> On Thu, 3 Oct 2024 20:36:04 -0700 Fan Wu <wufan@linux.microsoft.com> wrote:
>> Please add the ipe tree
>>
>> https://github.com/microsoft/ipe #next
>>
>> to linux-next.
>>
>> ipe is a new lsm we introduced in 6.12. I'm still in the process of
>> setting up a tree in kernel.org, so I have to temporarily use our
>> github repo for hosting patches for the next merge window. I will
>> give you an update once I have the proper tree setup in kernel.org.
>>

