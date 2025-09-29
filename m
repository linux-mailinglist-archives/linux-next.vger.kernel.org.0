Return-Path: <linux-next+bounces-8513-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A257BA7EDB
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 06:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4538117DD33
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 04:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEE786323;
	Mon, 29 Sep 2025 04:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="aAn1LdMe"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69CA33F9
	for <linux-next@vger.kernel.org>; Mon, 29 Sep 2025 04:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759119346; cv=pass; b=EHQ3j9U+itTi1+fZEuZhD+FvzatOXZ/NtCrZNRl5+Eh9m1x0FhzzY0jBz8NrOkvHZZ7/EeNPcu3UsB81+SO/GPtSeEVbteNocpyG4TqfGbw4nJOC1xG2cCakRstQN0j/d/2qVFTlgsGHwdxRk81wiF/2kIwvjVxnMZgbUvonjXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759119346; c=relaxed/simple;
	bh=4VGHV4/A319H/0sQtCBFb7zsNGq2H+CR9M+BkV8xXOw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D41yVvUHUPHA58ByX/3PSsTEtpNQU1gDNJ5AHg2WXX+lh43NVw5Pl5us+pKQXLFXLfMnu0saOyHP1gs7Wm0iJDahjcvU+8OiYsZSR9QW0kAODwt1RNnVEG1Ajilasln3B/6Qq7qF9d8yaPjOQbm0BUxlf0QsmgGH655ql5KieH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=aAn1LdMe; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759119331; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vh089FZjQ2qtMyvXrcHAQIe+HVCm19NtZSmTK3kQH4Uj1unesXsg2Pb4i8W8wGm2bTor0W6h8z9uHdDp43p/NrDUzATK3c36uUFxZMX0JXRl3sqwBbJBn9HGBYaSIcksJMWVxXrNZS2/Zgq69cKA6UpMF9IPgipXQRIXJXE2Tpk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759119331; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4VGHV4/A319H/0sQtCBFb7zsNGq2H+CR9M+BkV8xXOw=; 
	b=DIVuZ1pmm/NMjgxW/paaZOr8vejdAnbYrk9EFgxpzx39ThePgK5FMpCxEKq7waFaVi9TdohLPnYZbDyYyfmYj7jS9IxNf+wnKIG+946RRr0cDBVN9FF1Fq28AQ6uX38G/PFDCUbwdX8yuuBLG9S+1+Xezsaou5m84dhti0pk5y8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759119331;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=4VGHV4/A319H/0sQtCBFb7zsNGq2H+CR9M+BkV8xXOw=;
	b=aAn1LdMebKOOUpLZv0Q2MJ4ftaPK9BzbelFpKYbKnHC74U8owgjpMvkYKp7bfWHk
	M8XAGk1qC9qi6w+9u/C+PP9Wy7f1SESHgbTSn75aHzgdSUIILfVBf/u+boaUi1gQd9D
	Mi5OqIoSGDVHIBHazR2XOsVMiPZ9mU7DqNfKLrOA=
Received: by mx.zohomail.com with SMTPS id 1759119327847600.3374137196645;
	Sun, 28 Sep 2025 21:15:27 -0700 (PDT)
Message-ID: <b10bcf92dfd2fc13ed90b4da6e9ab8a3b61ce724.camel@collabora.com>
Subject: Re: [REGRESSION] next/master: (build) undefined reference to
 `pm_hibernation_mode_is_suspend' in vmlinux...
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: Randy Dunlap <rdunlap@infradead.org>, kernelci@lists.linux.dev, 
	kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com,
 linux-next@vger.kernel.org
Date: Mon, 29 Sep 2025 07:15:24 +0300
In-Reply-To: <bb21b532-b68f-4c02-a9bd-7e8aa3c07258@infradead.org>
References: <175890594349.36.5014274970333071394@1e895cdadf47>
	 <bb21b532-b68f-4c02-a9bd-7e8aa3c07258@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

Hi Randy,

On Sun, 2025-09-28 at 18:13 -0700, Randy Dunlap wrote:
> Hi,
>=20
> On 9/26/25 9:59 AM, KernelCI bot wrote:
> >=20
> >=20
> >=20
> >=20
> > Hello,
> >=20
> > New build issue found on next/master:
> >=20
> > ---
> > =C2=A0undefined reference to `pm_hibernation_mode_is_suspend' in
> > vmlinux.unstripped (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c)
> > [logspec:kbuild,kbuild.compiler.linker_error]
> > ---
> >=20
> > - dashboard:
> > https://d.kernelci.org/i/maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a8=
93
> > - giturl:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > - commit HEAD:=C2=A0 262858079afde6d367ce3db183c74d8a43a0e83f
> > - tags: next-20250926
> >=20
> >=20
> > Log excerpt:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux1
> > ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function
> > `amdgpu_pmops_thaw':
> > /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2677:
> > undefined reference to `pm_hibernation_mode_is_suspend'
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >=20
> >=20
> > # Builds where the incident occurred:
> >=20
> > ## cros://chromeos-6.6/x86_64/chromeos-amd-
> > stoneyridge.flavour.config+lab-setup+x86-
> > board+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy on
> > (x86_64):
> > - compiler: gcc-12
> > - dashboard:
> > https://d.kernelci.org/build/maestro:68d6bd56aabea828fddae00b
> >=20
> > ## cros://chromeos-6.6/x86_64/chromeos-intel-
> > pineview.flavour.config+lab-setup+x86-
> > board+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy on
> > (x86_64):
> > - compiler: gcc-12
> > - dashboard:
> > https://d.kernelci.org/build/maestro:68d6bd59aabea828fddae00e
> >=20
>=20
> Is there a URL for the .config file that causes the
> build error?
Yes,
https://files.kernelci.org/kbuild-gcc-12-x86-chromeos-intel-68d6bd59aabea82=
8fddae00e/.config

You can safely disable the firmware files option. The build error will
still be reproducible.

Thank you for feedback!


>=20
> Thanks.
>=20
> >=20
> > #kernelci issue maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893
> >=20
> > Reported-by: kernelci.org bot <bot@kernelci.org>
> >=20
> > --
> > This is an experimental report format. Please send feedback in!
> > Talk to us at kernelci@lists.linux.dev
> >=20
> > Made with love by the KernelCI team - https://kernelci.org
> >=20

