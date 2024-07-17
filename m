Return-Path: <linux-next+bounces-3048-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0CC933574
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 04:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29BB92827EA
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 02:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8931133D8;
	Wed, 17 Jul 2024 02:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nbj4jt8O"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FB0320B;
	Wed, 17 Jul 2024 02:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721183595; cv=none; b=o+d51TQD/ZKG3z2+6WEJ83qq3wokC5YkyMSl5j6yX4vjw1Bgk4ILy1UITB0nqvyS8PYkr5ZxaITPo2xTCAdlIiOlf7TGn3Unocx3VDBw12CzdPiObylIKGayeFa0EEwc7Le+0NRgpV17L9FlsU3Jba6J2AdNjh3GsyCkKssIJwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721183595; c=relaxed/simple;
	bh=OLo9dOPzi8QpJ06JGaUxrusQc3E2a0sujifir0YTOi8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jhULXskFiNjaddPEwOFHzqUfcFNJ83q5TkZjQdIaocvzF6FDx4H2gKNiVtVRHSx6kjmqkQcfa+CDXK1wR29PiVcOCnXhmQSQmB8sWbkMo1lbC84U59oMaY/EPY1vkpTVS/jICv3pMxwuVL4vm8baRthKctcQnA9/Fskd6S7YfeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nbj4jt8O; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721183593; x=1752719593;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=OLo9dOPzi8QpJ06JGaUxrusQc3E2a0sujifir0YTOi8=;
  b=Nbj4jt8OpurYSLWzkByty+v/bTI4XiQtqJhEI8xlH9cndbxD1Lahppmj
   Rk1MGytK8QL1Q8oIJbdnxcPrJLJ5SO79DKi/js+AwJK2IEHaHL0p50gGP
   YEsUofgjCm+ofHFVYomUzyVuCqKwbgVevxs8XyeX/FYxaC4Fx7Zj/jmaW
   dpgUa8+Ku1NK398q6nmXAI6sVvdIUZg8f7zkMR27NHv9iaThnKE7XbxaW
   go4E1iTABXp1rQV9/a7RFx0iQrSVV9i/qis5Zs/X0fY3R2pr2sEukrfPi
   p3nLFAh5XgPOUXSuc042fSfh//8ArWHkYYjTGXXzl2j0k9LsPCFEWxN45
   Q==;
X-CSE-ConnectionGUID: bAB/5B0iRDadxD+2lev25Q==
X-CSE-MsgGUID: hlogxQzYTC6ORq6kA4QOkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18527674"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="18527674"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 19:33:13 -0700
X-CSE-ConnectionGUID: On/Ed3sLTTiit4q4iy2qeQ==
X-CSE-MsgGUID: u0h9WhSMRnOjCHT0W9gY3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="50159609"
Received: from spandruv-desk.jf.intel.com ([10.54.75.19])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 19:33:12 -0700
Message-ID: <38ff1530e63a1659f35c3a0ff315b17b65f2dbd5.camel@linux.intel.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>,  Perry Yuan <perry.yuan@amd.com>, "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>, Xiaojian Du <Xiaojian.Du@amd.com>
Date: Tue, 16 Jul 2024 19:33:12 -0700
In-Reply-To: <20240717114155.1a3d4c07@canb.auug.org.au>
References: <20240702141555.3494c5a6@canb.auug.org.au>
	 <20240717114155.1a3d4c07@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-07-17 at 11:41 +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> On Tue, 2 Jul 2024 14:15:55 +1000 Stephen Rothwell
> <sfr@canb.auug.org.au> wrote:
> >=20
> > Today's linux-next merge of the tip tree got a conflict in:
> >=20
> > =C2=A0 arch/x86/include/asm/cpufeatures.h
> >=20
> > between commits:
> >=20
> > =C2=A0 c7107750b2ff ("x86/cpufeatures: Add AMD FAST CPPC feature flag")
> > =C2=A0 7ea81936b853 ("x86/cpufeatures: Add HWP highest perf change
> > feature flag")
> >=20
> > from the pm tree and commit:
> >=20
> > =C2=A0 78ce84b9e0a5 ("x86/cpufeatures: Flip the /proc/cpuinfo appearanc=
e
> > logic")
> >=20
> > from the tip tree.
> >=20
> >=20

[...]

> > =C2=A0 /*
> > =C2=A0=C2=A0 * BUG word(s)
>=20
> This is now a conflict between the pm tree and Linus' tree.
>=20

linux-next branch of linux-pm tree needs to be rebased to Linus's tree.
This is the diff:

363a364
> #define X86_FEATURE_HWP_HIGHEST_PERF_CHANGE (14*32+15) /* "" HWP
Highest perf change */
472a474
> #define X86_FEATURE_FAST_CPPC         (21*32 + 5) /* "" AMD Fast CPPC
*/

Thanks,
Srinivas


