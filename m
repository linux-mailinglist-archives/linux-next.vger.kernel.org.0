Return-Path: <linux-next+bounces-5723-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF13A5B928
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 07:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 858CC1895115
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 06:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3FB1E104E;
	Tue, 11 Mar 2025 06:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="pUH2nTQ5"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EFA1684AC;
	Tue, 11 Mar 2025 06:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741674135; cv=none; b=bfUxchG0T2yWq2TdrWQWCKCEcjyXtD3mND1lzGdGr+ubCE12DTqwrRMsmZMc1IJgZ9QnKYyG+xIJn1EoPkCupgH1WD8YEVrz8hRKOnri/1baVZh/gH0Ytj2SmWdLfLtm/ZrtgjFNNWal2SE9tObUD08qMkAS04ebXj9iD+tXZrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741674135; c=relaxed/simple;
	bh=CjMfu1/BYp6fxCwvprSHtpdDUUGIcPtskeSLRTb/RL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OUgzc2vcxD6t8LI1M1dVCE+qvntw/vvEKJ4471keuNHiFsnfsVDV/tQO7JYxjp9AcKo6eD2wIuu2CRbgdvuFe7WgmlwdRyZp/CvIR181v6/pszziFjBGwRocnhOBMRGRd7SyuefWvQEQ5vYZXUn7uZdEORKSJuh/o0aFtDi7t9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=pUH2nTQ5; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1741674122; x=1742278922; i=deller@gmx.de;
	bh=SRHBebjBNXM4fod5aEeNFESgCczxuBKBAyYU7j61vG0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pUH2nTQ5yvE1NbUA43RVznw6tZjU5ifENzR2sDqPBwU+7qKBm6Zz35t992BJfDYA
	 YH4KfkPiCNxRRMUzIgtfd0G6EISUFyGQC2fHOp8knhKGk3DgisoElauyG0SrQ+kUI
	 qdDDaVv0aLFU84ZTAYdAOeQSt4hBGUbQY3H9VxjUVxxT9MxqxEHraM0MA8fs0pTmf
	 s3vJD57GXCVb0iBWB8dd+E1Et2z6DtWe7gXwHcIKpfSdzui8v0Zwbev9N2XnWheM4
	 dgDF6YnIXX08GVCP+jJR2109lr2l8u23Qxas0l+0TGO6NeMgXOZPGb9eajUKT75Jl
	 yDFIWA8PbIXcSR/Mpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95eJ-1tCAYg4503-00snES; Tue, 11
 Mar 2025 07:22:02 +0100
Message-ID: <efa8ffb6-2d6f-4007-94d9-2e41b4e7410a@gmx.de>
Date: Tue, 11 Mar 2025 07:22:00 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the fbdev tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Wei Liu <wei.liu@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250311143021.0cc40c0e@canb.auug.org.au>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250311143021.0cc40c0e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ALnnbLuDM9CoIoOf2LXY3gFvxC4j/Sq8MSMh0VgqgSgeLtBOMef
 uK9h/dtd2wLtrXXsT/5UfAoRcBSaAPs640vksmXWE2wiOoxzPepfo8sZTqXKmzehgG+ZK3I
 1DNd01h5rlyt8SvcAhPPM69ULsUtyi6roJZbgfrl4lL2SGOT/tIoDGEa60TI3rzHgTv/TFr
 qiVpt0JkRItolpxEkP0fA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FcioF6WzC1M=;NVyg4ekXInL9x3UxTRb6d29TtZw
 BKcYWHveL1uS1L5/cTOLh8yz3QHagtOqEKUV9VoPqnI2IcLPx1605PwINUElzFEEqL5hDN5Wb
 yHahmBwKdFr3UFuvDzOES/Imf7hZtQprLN0iGtYZehnVscxoYuay4aP8TLUe1N/+R2gbddq7g
 OG0PMIxHFXpn/iNN2kKeH6+o7Q1rtMTs26cBxst5cc3NLJVT4t277lOSoWqaM4zDTFH5c68nu
 TZL4kHNKf2aGCLY2UE7XZmuxnMslO3MDo05hrP0ivbas58TYaYA7hQ1Lyyh6pWt1rXm0MomK0
 ny+f9d1Pe8DPo7G5ztlQ4fSw1yL7bNqRYIK/4WmL8uEuR2pZKT/bEhAVYYehwqjHMw9aiiEok
 KDB+a58Om9+0yiOiXEMzxS+k1aKvANVuT8Clts3xIU5WVx4ybHrjtMNjxU90Dst9evTve0qXZ
 KY1CmrEc1CH7SF+vsGSIj+SBla8i8KUKtQ62agfuE7jXUmExnoisxaBxPmWKo1MC+l52RTq+q
 AhrLG3I0Rh/yxwSN+6KIV4q2e0OCClUCcOsyDrbN62vxZ6cGUlCpgRvg/RQxUlYdAqsZwF3Bo
 9ClZirhyVB8ggD+tvYt9XHmNG4XRt46dHLKH+ZtVt4B3C7yy26hp1dNX70qImpEDWMlaz+R0l
 U3p69vOxscJ+Uyj16tUGjlWQi3zAat+EqKRT6tYMNvnY9v6YqoY8KN4YOKpRhOKqbu+jMKgq4
 Klo+E80AqBbusw4COgqd2sC5b9kGo4TDs4tRPMDsYfme8wNkQ+qilEt2ez1++yBEyD+ixOUTD
 DKa8vYfpLk6f9adMzuJzGwpXziCUaGDdkAUu8if7fo7GnzgCQKbB49bUl02b93GqbnQsFGR0l
 T0g0EA7ZAkyZpCQ/1+WmKkA3SocH6NmGIGp1Km+UXzazGXhYuWcfzOWSCsBSVjTsmaQCoI5jE
 DwWCTBC+Q3Wk54Y7WTylW+i+yi20qwCPZcRRZhw9HmRtaetn+7/N0z1LhC1RUY3yXE+qcTpXd
 QAhACgazrSWnkMpC0BI5s/oUR1m4pbR8QLA1k9vT8H6bAgGmNXlg1hM+hgCSArCwJ9IS1gBHK
 NSFjjT7d52/6TVX4rA4D1ZSDhcf1ziJiDIyYLN5NiApnAGKs2H9PvSHUb+9JVEn8GYIyAfOfj
 E+8q5cXDypQp06N/v3JRgLk5WsFPuhW4r8ht3qDuqokxW80VfzUoMQn0QWr6ZQep+MEwD+8Oz
 sHlUF58rsBblXU7uXo3SPhFoBFJW05Qp9Hd7uFtMvGsY3IjvCCvmaFBd+8Ax5y/LaRppoRftq
 RXkY4dAAjfqk/sOlQm8jXp7WE174rKTT9AkFG5EWbfzYtWjEqgYfk4X5gUtXNy2ZZdKkKfi0Y
 BpyexRB0BGWc+N5/IxMyQzWaAPwi6kreLInADOp8MIcnaAkT0DPA8KQMP3

On 3/11/25 04:30, Stephen Rothwell wrote:
> The following commit is also in the hyperv-fixes tree as a different
> commit (but the same patch):
>
>    f2b558988c7d ("fbdev: hyperv_fb: Fix hang in kdump kernel when on Hyp=
er-V Gen 2 VMs")
>
> This is comment
>
>    304386373007 ("fbdev: hyperv_fb: Fix hang in kdump kernel when on Hyp=
er-V Gen 2 VMs")
>
> in the hyperv-fixes tree.

I've dropped that patch from the fbdev tree.

Helge

