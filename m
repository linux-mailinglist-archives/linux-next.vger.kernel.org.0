Return-Path: <linux-next+bounces-3032-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E43A9323B4
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 12:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A3C2284C99
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 10:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C34198A3E;
	Tue, 16 Jul 2024 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="VwSQfmY+"
X-Original-To: linux-next@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAA1198E80;
	Tue, 16 Jul 2024 10:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721124864; cv=pass; b=JT7XAmHfR+f7AtYXvU+6Y/a1g/n81eFnl+7SMQJtyqH7M6+Wuos92cizYQ3vSObwwz7K7UxzZw94Ln2OX/1azO0IbVIZGY6TD/7QIczNMsQEzE66+iw2Z4N5VEH9pskB7TljW+wfc6aaBsDxh0CIak+nq0ksA3eXx9tga+6qxHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721124864; c=relaxed/simple;
	bh=auHXyIzMq19o3h1AQgK/QLmEH0d6gJOwKegdbLLXI04=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Dl4Lc2JjdJm1wP8H2LgBtd0txa7QTw4fYKcF0DqfIBifQuj9ltu/PgMisfDEhMCuRXeduHdqDX0Cz7XCySykrDo/ao5zoj4VkX0MfG0Oq31sa4jhnJig1dEqE0Co3vIB+ByHB1tCxLQDHHEIrD2fq11J5g8Qi4hNbszXlST0m+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=VwSQfmY+; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from localhost (83-245-197-232.elisa-laajakaista.fi [83.245.197.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WNZfz26Dbz49Pv5;
	Tue, 16 Jul 2024 13:14:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1721124859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vz2BYHAepGUfzGb3RUlq/A9v/BHZkzM6AzuGybD702k=;
	b=VwSQfmY+Sd2+2AlWuzamso5sMnjPeLMRygKFA0zfpMv+bnebNUF6be3abdDyi+TzjM85vZ
	MXZsHUVoglqb/IUrjwH28VpkD0G5Hmj8KPvYfA22QnQdeHwO0+Eh3L0OSwSJBCoIGxZ3eX
	eX4Xpfvo2jeKtpL9bDxEc6nH7rjl+f054tFshnLVyarIcE59NkT3pJUG1DNobRa/258tki
	ReUsA64BPzqvPq6ucfQi7OIye8qO4VaESeL6iGs/Od72oVZ4dI/g299CORRQd4T97z0oYt
	d+PtYg+llp83oujWPsRb8klk3dq7G9REkNhx7Tw/yUyGH+LTl9i5XsxEgTh86Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1721124859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vz2BYHAepGUfzGb3RUlq/A9v/BHZkzM6AzuGybD702k=;
	b=v2loLBE80vmcksXCNMms9mEeGfpCza2+PN029FuHy/gCrT/66ZQ6iQnMv8BWgg0r+PaUqe
	gyzx6oN8x/t1ilOkqhn/03VZCKIF6v5dGmgcYk+K60ok3U/ZNJPmScw3qwWxm+YYl4cB/S
	ucD+38SckXiC3YuelheTYINIEAO/lNhxh7NoRp5wP5cXjN29nwPwUSC36mxSpKstOZKA6N
	iEx9TYIeGmNxl9m13T5qKBZGsTh/mjNfQ3IndeLkxh8eBIkp1l5YHK0vNHuEAWR/aKYKCb
	KfAPls43JjIyiqs7ZYpuecbvJwi7H2iwa2a8hziRo/sZjfSCyMFmfNh8few7Jw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1721124859; a=rsa-sha256;
	cv=none;
	b=WdXvUcuVyZzRufikyCshNbB1HPnUcRFSxsubQzkhpExrPfRlt/8iCvhlJMGs0l8cBdsskk
	SnGNHB1HTy9S7jHXYm+axild+FnWTxYappghfIYXL6bG9AKwe3iTF8TVSRVJCAKNv79hPF
	k8J2rCOfuoWELHNbb4D3szNdpMzFxVSdk52w6lC1e7DfN0ak7ZsKMJmSTnoZfsNmhwi2gy
	tdzOrQveFgwWcVrtjP7iQUR6Pl6S3Or+Nkd7vDB01fV5OXyYhrLiGL4w5yDK2oZWkF0Mjc
	SJktWIQoo/qR0Zf2K/7ocE6MmIwQpMgmLo3mGdyspvZwHflze5YcdPtHVZ4RoQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jul 2024 13:14:18 +0300
Message-Id: <D2QVUCH4G25N.XSO2PYWM0AOR@iki.fi>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the tpmdd tree
From: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Jarkko Sakkinen"
 <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240716171927.46b75f4e@canb.auug.org.au>
In-Reply-To: <20240716171927.46b75f4e@canb.auug.org.au>

On Tue Jul 16, 2024 at 10:19 AM EEST, Stephen Rothwell wrote:
> Hi all,
>
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
>
>   46ebbf4061e2 ("KEYS: trusted: add missing MODULE_DESCRIPTION()")
>   6e9a602077a4 ("tpm_tis_spi: add missing attpm20p SPI device ID entry")
>   732cbb267287 ("char: tpm: Fix possible memory leak in tpm_bios_measurem=
ents_open()")
>   b270b463aaad ("KEYS: encrypted: add missing MODULE_DESCRIPTION()")

Sorry, I came from holiday to fix some bugs, and forgot to update my
tree. Now it is fixed.

BR, Jarkko

