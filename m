Return-Path: <linux-next+bounces-2441-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7D38D72DA
	for <lists+linux-next@lfdr.de>; Sun,  2 Jun 2024 01:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1135281CC2
	for <lists+linux-next@lfdr.de>; Sat,  1 Jun 2024 23:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596CA224CF;
	Sat,  1 Jun 2024 23:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="XOsu+Nzj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0121D1EA91
	for <linux-next@vger.kernel.org>; Sat,  1 Jun 2024 23:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717286016; cv=none; b=B4aOeJaPRHpkEjX3mnnrNFsco3LzNqt8DJDn566TxibrtFqwFqbO11k8Oc4Kp2VzIjoPidhbnTZ7HKGj4hgE0Ye26HOJWGOX+z2zKwKT/5wY7N7ABe9+0HIVdNoHVIA0HsbW1YLBmWBF7QK8BkfZ/eK8+Kf/k83QeHrlFLNVKDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717286016; c=relaxed/simple;
	bh=Z9xvadPiEqgfKNt557fMMDkDstChvzCU+loz3ipWUXU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fPZVxC0PwPuKGYB6989dMI0tv9pJjvHSwm74mMm4KjlheofXKpgAViyE4H5PK0r3R8NFeqsa7AGdkOydQlRDhspTFzcx/IWIbfdoYNzaYNAOlQSfUfNKkjsHyLhMseJeSWlV7x0xtYqB3N3MagGjJ0Y03kjVCYxk+3e5UrqNKFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=XOsu+Nzj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717286009;
	bh=S0HZKZXPDUjdP/Zns/yrz/j18B42GMOAvW6WjeLGr9Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XOsu+NzjKw6hkPSAxzYY5P1qryMR9uKglPbB5M7Z8yb1/eq9Hw7GDE7IajTVj1VLi
	 /1IZ8aZWg7YEeVtZF9eskihotOlDgftU/A4xjwE9jLSsOUQfTtp8qFy6tJ6RDaBs3V
	 LG8kwlPnlWWG5RR892O9hR8YNTPd7B/8Lwr90bmZWK6qRoUYm3ECheG0s/9uLEcJEm
	 Dc7dFlqGIg4fgf0exWQK571xzZtFW4jgtBoXdqER45aW5hJ4tqFBD8dfFXE9ZVCuCc
	 6uu1AZM55ZzfcG9mLG3hlq23q2Bpr33bTBAgrvT3CFnZgBAF4aSvuAuyE3aKwHaqxz
	 +YWV2cszZ89/w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VsGyw5Pl2z4x32;
	Sun,  2 Jun 2024 09:53:28 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, kexec@lists.infradead.org,
 sourabhjain@linux.ibm.com, bhe@redhat.com
Subject: Re: Please add powerpc topic/kdump-hotplug branch to linux-next
In-Reply-To: <20240424074023.43932cca@canb.auug.org.au>
References: <87bk60ji79.fsf@mail.lhotse>
 <20240424074023.43932cca@canb.auug.org.au>
Date: Sun, 02 Jun 2024 09:53:27 +1000
Message-ID: <87mso42pag.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Michael,
>
> On Tue, 23 Apr 2024 23:56:42 +1000 Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
> \> Can you please add the topic/kdump-hotplug branch of the powerpc tree to
>> linux-next. It contains a series that touches generic kexec code as well
>> as x86 and powerpc code.
>> 
>> The hope is to have to get it merged for v6.10, so it should go along
>> with the powerpc next branch in the merge order.
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/kdump-hotplug
>
> Added from today.

This branch has now been merged and can be dropped from linux-next,
thanks.

cheers

