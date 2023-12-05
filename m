Return-Path: <linux-next+bounces-236-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F1805B04
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 18:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51C5E1C20F8B
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 17:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C155F692AF;
	Tue,  5 Dec 2023 17:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nWU9bPuz"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8414C1A5;
	Tue,  5 Dec 2023 09:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rZWO8O3rbEJ89oVb0TW+xEKhVkIpjIUUnu1HN5v2x/A=; b=nWU9bPuzRIs1NBesKFM+yxaRSy
	yJD+9m9ybkN79+xyYan3g0+uPzCswjbsi5IZr97QDbzh6PBN9qG1HZi6hHDozPabO5T4iECywogQZ
	aw2PvPV4+bcBVdGG2ewNFdKup3Bw+zCsOdJndw+g2WyCm08flD9L5dTlV3duyOoFjuy+FD4Lnd1cS
	pPnn8VnUdYISvdW10TB2AFoR2d+AGqcnVK/LKKcChhp8lhTZ9tj/au+yfsban4WS8JJ33C+tariO8
	DqZTsJi6PvCLvC6xyZ2bkX4Dg9ZJxhH5I+OC1Ybqnz/vqESHy8qk2n5a3wPIeQnLA/3fA/V9dAj0f
	6hYyLxLQ==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZ3G-008159-10;
	Tue, 05 Dec 2023 17:17:42 +0000
Message-ID: <50d8f1dd-4df2-446a-bd82-47d96637b507@infradead.org>
Date: Tue, 5 Dec 2023 09:17:41 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Dec 5 (soc/qcom/qcom_stats)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20231205135708.4a5a8413@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231205135708.4a5a8413@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/4/23 18:57, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20231204:
> 

on powerpc 32-bit:

ERROR: modpost: "__udivdi3" [drivers/soc/qcom/qcom_stats.ko] undefined!


-- 
~Randy

