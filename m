Return-Path: <linux-next+bounces-7537-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D8FB04AB2
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 00:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F281F16A1F5
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 22:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300EC286A1;
	Mon, 14 Jul 2025 22:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nC2v84ys"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C67B1A5BB1;
	Mon, 14 Jul 2025 22:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752532217; cv=none; b=KcYiV2M6HcszZ1OdVAwPHBF33F/QYX6reeiiE2XfRT8Xb2L2gJrg/t55cJc+iBXYLfDPKEgaBTDyPeni0xC+XLJmvhv1x9kUytml5uXGXjTHvu65v7KV3QQKpPE8/GF8lWzc57lKcyol4wFDrjgeyfqG5cN9H4t4orB8tWPGC+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752532217; c=relaxed/simple;
	bh=iXqppg9k8rV1d6w4yOEjGAZY8uZOr1ScrIu3M0QPUkQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F7gu3pjtpCehy+zamaEMJBgzy2xrQiw9ZKN1QKkwGOzUHxAAopZUCxOq4i2ehg/+3Qxo/3kDhzRggflj406UEUX79+fIAzXACaCLhHluv8Dcij9E73EOJBzVggaUbz7G6apRUJOr4aqIJAPC0T2zJt7Z35sLIPTxVBt+3dWH4NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nC2v84ys; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-8760d31bd35so182465139f.2;
        Mon, 14 Jul 2025 15:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752532214; x=1753137014; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iXqppg9k8rV1d6w4yOEjGAZY8uZOr1ScrIu3M0QPUkQ=;
        b=nC2v84ysSST/fWf8/AphARrzEHuxfoTziYHtlOxCC5+E8PptK885+fW/+GOqziPd4j
         3uw0p24m4HCeXyIPYRCxvOmoW6RRokObJbhEvYJVEf2WJP7JoNuQlxEcVQVrh5WOXwwo
         85T1VinIDEfQMnABWwas4JIRRTlWz/8WaYtT93oUXdO9ci/l5NvmqW8w8YDssq+sYKQb
         KjhguT4+DXWbxYozaebF3176YnwuWvAlOmRVgMwb83ImJ9umABuPkg7xFphT9RHuQ5XF
         fQ+I/7n7njzNEuPeozLFkqIsh24Dpu5Yzi1eyspY+HW6lgCWcN6AstW591REZSC3Ltuy
         ZsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752532214; x=1753137014;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iXqppg9k8rV1d6w4yOEjGAZY8uZOr1ScrIu3M0QPUkQ=;
        b=ebAmE0ZMRcNWVvVnIfgaWi1xQG1AD4QU2EUWQ3Pzf3FbYlA1jyuH9SBl14R+KJW7wu
         oxTQwnDqMu3IhwK2nStgvjkFttZ4jT2GWTRCd/WDLMDts6kgVR4dYgnXlRv0z2mkgQM1
         gVfxkG8CssyJ0OEnTxiQceKCybE6VX58QFqkh9zLqX62G73pVs2yQCZuRQzOlqYkYOXg
         NaxNYZzBZzMB8vfegVsIZzCGMgjaG74jRlVhcQW5NMBfmzES3CoJYa0hqvwUKfP4OAnj
         84tomb1tA7Pq/hYqDC6+kZkTV11Pyxuf5lyAGjke9CrZ6845YC+YnSCregzwUiU/7TON
         Qtvg==
X-Forwarded-Encrypted: i=1; AJvYcCURU7KzPpzVMXVec2tDd7+Y/SMkoHeLq+U/E+SYdQI9Ci+IqSNL18XS+8AB0C9qlF6IIuZiehNda5BDYwc=@vger.kernel.org, AJvYcCXJnOi/vYPQzDaWZHM85DPI9q56z1s+qehmPfv399Qg2oEY4MJ+LJnBogNNjBD+vvoOaB64fweSVDIs7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY+iOXpYKdVBtTB+jak6DPMcs5SCQvWNj5FyyoIjMBUVPv3OEQ
	3Fltt4ISd+qtVr8vXsbEW1nXlbzSxTu2ZYsYazwVmWTAF0olSDlod2mGX8epsrw=
X-Gm-Gg: ASbGnctYR4sw438C/upp9ltPn6PZaH/gpmXL3jlLGPVjmr2lDFExKbcj6cAGVdg5dzk
	y6aqQboB4qdoOeAGu6G8H1T8Mf0PPtFltmXfWYF0eJ3w3KP+49vVL5Vsc9abdAm8v8/htF6WplS
	Wn6E6Y2EvOS2ZOC82Tr6yBkV4TVsRTC6rM0okstEXbW/zABfz5EVuudaGSX3khKIbHOx6jFfueT
	rg0DFZPJrYur6tsuSRTh/npbjHsIKxfMsrgxsISZjyu7JVm17YsBUPhzN7am2gHC6TYhENT4yZV
	fLhyunKdjyMUrwtPfTxOakKZcUvPPyNX2YsDgNvt5BQHhEI3KvaXRkt4ge00oKRukMEa+9LRPfr
	KwFlW1YtWKiC3ImnGAS5djwyigHvZolm/kXP8ug==
X-Google-Smtp-Source: AGHT+IHygS17S19Nxz9wCfYqxbOBgc6XAIudJj4aYVo1DBv4RIhZTMfupb8fQiLbUq/dSVUg716FPw==
X-Received: by 2002:a05:6602:13c4:b0:864:9cc7:b847 with SMTP id ca18e2360f4ac-87977fe5c3bmr1903389239f.14.1752532214534;
        Mon, 14 Jul 2025 15:30:14 -0700 (PDT)
Received: from leira.trondhjem.org ([204.8.116.104])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8796bc1313asm270321739f.28.2025.07.14.15.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 15:30:13 -0700 (PDT)
Message-ID: <6af3f3273703c29dad890934a7fdb14153858ff8.camel@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the nfs tree
From: Trond Myklebust <trondmy@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>, Linux Kernel Mailing List
	 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	 <linux-next@vger.kernel.org>
Date: Mon, 14 Jul 2025 15:30:11 -0700
In-Reply-To: <20250715075731.52b7485e@canb.auug.org.au>
References: <20250715075731.52b7485e@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-07-15 at 07:57 +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> In commit
>=20
> =C2=A0 dad2fe3c563d ("NFS: drop __exit from nfs_exit_keyring")
>=20
> Fixes tag
>=20
> =C2=A0 Fixes: 2c285621176c ("nfs: create a kernel keyring")
>=20
> has these problem(s):
>=20
> =C2=A0 - Target SHA1 does not exist
>=20
> Maybe you meant
>=20
> Fixes: 6a247819238d ("nfs: create a kernel keyring")

Thanks! Fixed, and ditto with the other one.

--=20
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trondmy@kernel.org, trond.myklebust@hammerspace.com

