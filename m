Return-Path: <linux-next+bounces-5603-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4DA48FAB
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 04:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C7D77A4771
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 03:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388AB19259F;
	Fri, 28 Feb 2025 03:37:04 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from wangsu.com (mail.wangsu.com [180.101.34.75])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB97187553;
	Fri, 28 Feb 2025 03:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.101.34.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740713824; cv=none; b=LKm+NoXlcckDsjqVPYdk5BPMHR4h/jx/VbBLXO5aZpI9/A9em1Us/7F96wpYn+EnePvL1lOT92SCc3dG5e+6zHQm2P7/mD28D9mrT5Y7npkm1h5S7hmttbKnwGEMmMZEm97WDOBe4UyuVFBNhyfMp6qQmepMDQgKpA8vb6V9bCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740713824; c=relaxed/simple;
	bh=TQzvWiOdvU5caeaRBqElrxoX75nvhd1b0LPDOE8juNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rrI659jCqKrqDFJxTcy35vv8XJfl+8ZJ+1m20CDEL5nNr9riCqgIDV+H0Gx35D3d2JiKVzu9oKYLQAh/POV7CB6Xlsisgvw6XYWlenvsgnCc59WAdmdASA0gWUrwlUvol3vbO8f1XOpp7cue9q29rOUfhJBTuwFfGgOzk2jbtXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wangsu.com; spf=pass smtp.mailfrom=wangsu.com; arc=none smtp.client-ip=180.101.34.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wangsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wangsu.com
Received: from [10.8.162.84] (unknown [59.61.78.234])
	by app2 (Coremail) with SMTP id SyJltABX2Qw6L8FnOmQLAA--.668S2;
	Fri, 28 Feb 2025 11:36:36 +0800 (CST)
Message-ID: <a8af57eb-97dd-406a-8f5f-c4375ca4fce2@wangsu.com>
Date: Fri, 28 Feb 2025 11:36:26 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the net-next tree with the
 vfs-brauner tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Christian Brauner <brauner@kernel.org>
Cc: Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Stefano Jordhani <sjordhani@gmail.com>
References: <20250228132953.78a2b788@canb.auug.org.au>
Content-Language: en-US
From: Lin Feng <linf@wangsu.com>
In-Reply-To: <20250228132953.78a2b788@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:SyJltABX2Qw6L8FnOmQLAA--.668S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFWrJF4UWryUJFWxAr4fZrb_yoW3trc_Wr
	15t3Z7Jr1DZw47J3yIyF4fZFy7Gr48tr15Zr1kKr17Zas8Zay5CF4Sv34DX34rWr9IkF98
	uF9IgFy8Kr129jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48YjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzx
	vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_
	Gr0_Cr1lYx0E74AGY7Cv6cx26r48McIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1UMcvjeVCFs4
	IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l
	42xK82IY6x8ErcxFaVAv8VW8GwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU59iSJUUUU
	U==
X-CM-SenderInfo: holqwq5zdqw23xof0z/



On 2/28/25 10:29, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   fs/eventpoll.c
> 
> between commit:
> 
>   d3a194d95fc8 ("epoll: simplify ep_busy_loop by removing always 0 argument")
> 
> from the vfs-brauner tree and commit:
> 
>   b9d752105e5f ("net: use napi_id_valid helper")
> 
> from the net-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Hi Stephen,

The conflict fix looks good to me, thanks for handling this!

linfeng


