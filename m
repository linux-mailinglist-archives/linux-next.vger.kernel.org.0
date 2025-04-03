Return-Path: <linux-next+bounces-6154-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9616AA7B1D0
	for <lists+linux-next@lfdr.de>; Fri,  4 Apr 2025 00:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15F6118922FE
	for <lists+linux-next@lfdr.de>; Thu,  3 Apr 2025 22:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEED2E62CE;
	Thu,  3 Apr 2025 22:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLy56ujV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233AF2E62A2;
	Thu,  3 Apr 2025 22:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743717808; cv=none; b=Hdh6ssyzmpU9jBJbkn9qzovbmnpOx73diYvzl4rGUXliaOVSmHMPHa0OMYK5no1RD8wmEFrVg8xSWa6cKAi+DCAtI144L+yUDh7EMwwwQP08fvIfBt4Og2KQGdMjVzKKExONdXqYS2Eqlt25OgzNERUWhOPFIF0E6UtI1yMFCd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743717808; c=relaxed/simple;
	bh=NTehLNXmH7Bizbedi+xODEVPVgOQ2s+y/9axPGNjI2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3O4flAvq+PgcPEDurfaTidvOh/yFG4oRly/d4KDRDAHVhmwPqsApjS8m3cGX4OT0Eh4ttBU7+lbUewGtPVBdBJZVK5gO55SRacDUqJpYnAgoYyAM826k3PSUCGJWiEpp1nDAuXRkicjfOlA9rAzlis3KtJrEVVVb+zXeXO0NA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLy56ujV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43D0C4CEE3;
	Thu,  3 Apr 2025 22:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743717807;
	bh=NTehLNXmH7Bizbedi+xODEVPVgOQ2s+y/9axPGNjI2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLy56ujVv6L7NpCx01q+UdTSEeearvHP6IFSVNI+Uz6w1zaRLW7Z6hiewd2AwKrdg
	 /fiy2Cq/mRvzY/tsqzY+CTI/6M/8SJYFIk8+kluKVBZHwDds/KvLbeive+bgkF9C8T
	 +5wiLA1pup2XZGaErnITk3PDZdfXSkqoBAwimZEBdTZfY0jwAUnMh3jvN6yvlJN/C8
	 QnsWwcMmw2SyZ9sIObknp5cvloDg6hdHkBuCv9vXcfC5UJobkCGUVmwRpHvJ19mMkM
	 wVD+rxDLr6LV1T5rtrz/0JCknW/Stw2zd6Te2T74LLv0J1sH9jocBVXbnZ8D2tCrit
	 t4l9y8cGTgcFA==
Date: Thu, 3 Apr 2025 15:03:22 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, kasan-dev@googlegroups.com
Subject: Re: linux-next: Tree for Apr 2 (objtool: KCOV)
Message-ID: <gz4mvn6q55buqjtk57jxke7tq4ge2nxoxj4rqd2xmjin5ulska@wtesjas4n3n3>
References: <20250402143503.28919c29@canb.auug.org.au>
 <ffe48f0a-9217-4f38-83dd-5fbc4de3eb73@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ffe48f0a-9217-4f38-83dd-5fbc4de3eb73@infradead.org>

On Wed, Apr 02, 2025 at 07:53:09PM -0700, Randy Dunlap wrote:
> 
> 
> On 4/1/25 8:35 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20250401:
> > 
> 
> on x86_64, using 
> gcc (SUSE Linux) 14.2.1 20250220 [revision 9ffecde121af883b60bbe60d00425036bc873048]:
> 
> vmlinux.o: warning: objtool: __sanitizer_cov_trace_pc+0x37: RET before UNTRAIN

Thanks.  Turns out this is a duplicate of an issue for which I posted a
fix earlier:

  https://lore.kernel.org/41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org

-- 
Josh

