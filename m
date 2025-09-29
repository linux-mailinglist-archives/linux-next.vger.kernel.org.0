Return-Path: <linux-next+bounces-8517-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28906BA9138
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 13:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D78B73A28F1
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 11:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBB1296BBA;
	Mon, 29 Sep 2025 11:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="UGZGCrE6"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924C42571C2
	for <linux-next@vger.kernel.org>; Mon, 29 Sep 2025 11:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759146046; cv=pass; b=CaLILoMi5YC0eDp22ZOMis7i0Omo1u1pHPYnchPg88MLbAkzf7IF70Cn1GkrXYZNot5J63qWZwE70K2BVFhbLEmgyhobWWf1PqrIb5osql6M5Z7X5Ett19GJMOGdnOw2Zbt1gvhvWC4GqNflAO/IO9opsOdO+Lvp0xTWlKW4bVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759146046; c=relaxed/simple;
	bh=t4HPCmbSZ7KPxv+YtKRZJV8CeOnbdMb3auZdX+/t21Q=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=qSrEAy24EL/ABPUKnQLm6d2852Zuv3sesJylmF5ehbES4WeMW4zTTxNsmF4XESX1VIrXe8LW2Oi4BswGCLK5FseabLQj5IC7jy5wiUGhUxtzfRQXiSe6e5VN2eBQQE+htChVqe1PHeyUPXg8awvKcoctH75FTnKo9eoYTH9hEsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=UGZGCrE6; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759146037; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UbVEbJgwLhbGImFUlkOne36D2RyeEWPmWu4B+ppghdGnU3PJBepaazRU/VHVYOBHML/4UBJRCuSeg6xEbitZrcH9mt+HLCB4CWlNxGOA6atTxOr5W/F8WXBYZeep0O3tagPk5pRoIf1jfsit11dQujSJsUiQ8BSn4ZjvVHB+C9Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759146037; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Gr2ud+7pnO2idJUfZ1ygGkUOU5cQ7t6/cfA+nmLSymo=; 
	b=dd1FXqMpWqJr0kWou5Cq2HqYo+zksh4Zmhg12GPN9OlbpBdeApLOuV39QfsefGwf0oDv1dUm+N+y3UuBSZyCeu8JYW+LhniFcsyW1UNXz4xhqw0Kzk04aCefZng2iFP6SO/k4o7ac9u+g6Vbyh/fbGTXafdMG7CJwu09yiX7uKU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759146037;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Gr2ud+7pnO2idJUfZ1ygGkUOU5cQ7t6/cfA+nmLSymo=;
	b=UGZGCrE6N7JFklL67np+On1mkDFZ6tcfz90YhoRlS11Z3skTbyokJDSrt4CJPWW8
	QgOucRxa2uptleyHmppMgfEi3KVAuqCUlpVgtqQGvA514bhLPHWSXRfQU/3eFpYtnVo
	FE9g+ZgyUlSiBu2st4lUMTEh9jgZsIpuix3wJux0=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1759146036779787.570110356764; Mon, 29 Sep 2025 04:40:36 -0700 (PDT)
Date: Mon, 29 Sep 2025 08:40:36 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Denys Fedoryshchenko" <denys.f@collabora.com>
Cc: "Randy Dunlap" <rdunlap@infradead.org>,
	"kernelci" <kernelci@lists.linux.dev>,
	"kernelci-results" <kernelci-results@groups.io>,
	"regressions" <regressions@lists.linux.dev>,
	"linux-next" <linux-next@vger.kernel.org>
Message-ID: <19995464e11.7f75fad1483203.4516273948739211660@collabora.com>
In-Reply-To: <b10bcf92dfd2fc13ed90b4da6e9ab8a3b61ce724.camel@collabora.com>
References: <175890594349.36.5014274970333071394@1e895cdadf47>
	 <bb21b532-b68f-4c02-a9bd-7e8aa3c07258@infradead.org> <b10bcf92dfd2fc13ed90b4da6e9ab8a3b61ce724.camel@collabora.com>
Subject: Re: [REGRESSION] next/master: (build) undefined reference to
 `pm_hibernation_mode_is_suspend' in vmlinux...
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi Randy,


---- On Mon, 29 Sep 2025 01:15:24 -0300 Denys Fedoryshchenko <denys.f@collabora.com> wrote ---

 > Hi Randy, 
 >  
 > On Sun, 2025-09-28 at 18:13 -0700, Randy Dunlap wrote: 
 > > Hi, 
 > > 
 > > On 9/26/25 9:59 AM, KernelCI bot wrote: 
 > > > 
 > > > 
 > > > 
 > > > 
 > > > Hello, 
 > > > 
 > > > New build issue found on next/master: 
 > > > 
 > > > --- 
 > > >  undefined reference to `pm_hibernation_mode_is_suspend' in 
 > > > vmlinux.unstripped (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c) 
 > > > [logspec:kbuild,kbuild.compiler.linker_error] 
 > > > --- 
 > > > 
 > > > - dashboard: 
 > > > https://d.kernelci.org/i/maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893 
 > > > - giturl: 
 > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
 > > > - commit HEAD:  262858079afde6d367ce3db183c74d8a43a0e83f 
 > > > - tags: next-20250926 
 > > > 
 > > > 
 > > > Log excerpt: 
 > > > ===================================================== 
 > > >   LD      .tmp_vmlinux1 
 > > > ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function 
 > > > `amdgpu_pmops_thaw': 
 > > > /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2677: 
 > > > undefined reference to `pm_hibernation_mode_is_suspend' 
 > > > 
 > > > ===================================================== 
 > > > 
 > > > 
 > > > # Builds where the incident occurred: 
 > > > 
 > > > ## cros://chromeos-6.6/x86_64/chromeos-amd- 
 > > > stoneyridge.flavour.config+lab-setup+x86- 
 > > > board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on 
 > > > (x86_64): 
 > > > - compiler: gcc-12 
 > > > - dashboard: 
 > > > https://d.kernelci.org/build/maestro:68d6bd56aabea828fddae00b 
 > > > 
 > > > ## cros://chromeos-6.6/x86_64/chromeos-intel- 
 > > > pineview.flavour.config+lab-setup+x86- 
 > > > board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on 
 > > > (x86_64): 
 > > > - compiler: gcc-12 
 > > > - dashboard: 
 > > > https://d.kernelci.org/build/maestro:68d6bd59aabea828fddae00e 
 > > > 
 > > 
 > > Is there a URL for the .config file that causes the 
 > > build error? 
 > Yes, 
 > https://files.kernelci.org/kbuild-gcc-12-x86-chromeos-intel-68d6bd59aabea828fddae00e/.config 
 
Out of curiosity,  have you tried to find the config in our Dashboard? We added basic information in
the email report and then the Dashboard link take you to our comprehensive report.


Any feedback here?


Best,

- Gus

