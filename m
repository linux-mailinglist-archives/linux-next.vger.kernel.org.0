Return-Path: <linux-next+bounces-8355-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B49B7C4C9
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 13:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B8F9165236
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 11:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95792303A39;
	Wed, 17 Sep 2025 11:48:58 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C9284886;
	Wed, 17 Sep 2025 11:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758109738; cv=none; b=CaRIlbgIy3YSU/QxpN7iGLtjUBpwe5WOVdvcCbZK05A0Tqt86dSxLjpadtwQ9kJaeT/EZW2ucrJRXcPtlQof1vVaghUoYa++ERt6U8Og4qloSzyk8Gt6+G0Q0DZRlbgEgDP86aCKqIBrw2ImKbnJs21jvO6mK1UiiDpUIJ+UoEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758109738; c=relaxed/simple;
	bh=ZZ7MXeClk0b3O8H9jOKf2HEQb298W9lEivFAzlzCCTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMu4BiomdU+ylRvj2VyABK+HM8ZqHcOwm18NkUq/nQSEuSgommmGpwNk5WU/f0UnAaxNjjmEcaq6qem9d6nz52B9yoBREh6IA6mtBQ3O+tkk+q390tf3CF9Xh5UMEcT+baHZ7I74It5jbadl8O1c5wmF054mvzNHhdlchWMoN0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.0.107] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowADHaRMSoMpoxqRdAw--.3550S2;
	Wed, 17 Sep 2025 19:48:34 +0800 (CST)
Message-ID: <597466da-643d-4a75-b2e8-00cf7cf3fcd0@iscas.ac.cn>
Date: Wed, 17 Sep 2025 19:48:34 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the net-next tree with the spacemit
 tree
To: Mark Brown <broonie@kernel.org>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Networking <netdev@vger.kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Guodong Xu <guodong@riscstar.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aMqby4Cz8hn6lZgv@sirena.org.uk>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <aMqby4Cz8hn6lZgv@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:zQCowADHaRMSoMpoxqRdAw--.3550S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrW5Jw13Cr18GF1UCr1UAwb_yoWftFbE9F
	yakayDGw4kJF4UCa1Sqan7Zws2grZ5Ar1fJF1aqryIgas8Ar95CrsxCry8tFnxW3s3Zrn8
	Ga47X3WrA3y7ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb7kYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28I
	cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
	IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
	42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
	aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2wIDUUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

Hi all,

On 9/17/25 19:30, Mark Brown wrote:
> [...]
>
>   3c247a6366d58 ("riscv: dts: spacemit: Add Ethernet support for BPI-F3")
>   e32dc7a936b11 ("riscv: dts: spacemit: Add Ethernet support for Jupiter")
>
> from the net-next tree.

I originally submitted these net-next patches [1]. AFAICT, this is the
correct conflict resolution. Thank you.

Just FYI, Yixun has proposed for net-next to back out of the DTS changes
and taking them up through the spacemit tree instead [1], resolving the
conflicts in the spacemit tree. This would certainly mean less headaches
while managing pull requests, as well as allowing Yixun to take care of
code style concerns like node order. However, I do not know what the
norms here are.

Vivian "dramforever" Wang

[1]: https://lore.kernel.org/spacemit/20250914-net-k1-emac-v12-0-65b31b398f44@iscas.ac.cn/
[2]: https://lore.kernel.org/spacemit/20250916122026-GYB1255161@gentoo.org/


