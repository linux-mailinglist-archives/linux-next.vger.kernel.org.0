Return-Path: <linux-next+bounces-5553-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FD4A41EC3
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 13:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79FB3188AD85
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 12:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4854219316;
	Mon, 24 Feb 2025 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zKSs7pgA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E801221F1A
	for <linux-next@vger.kernel.org>; Mon, 24 Feb 2025 12:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740399444; cv=none; b=fZKtLQrBMSrbE8chGvWo2aswlF7xcYI4p9tvyox8qxSFoRkQuC0wAyQjvrRmOx+5C9a9OuzwGj4kXpVVIY6vK8Pcof43Lozjp3/CKCMklGARxycy51B4am4DWezlbMcExUO3Mals+Z1vjMXpMv3bD0ag7KDucRxc5Y/6uIZxeGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740399444; c=relaxed/simple;
	bh=i8BCyQZA2KjDPBQrmOPrvK++2JfiudfMcGh50LMt8rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUdq6XfxryEgvMP/A3B8AD6HnJ8aVW9cOvx0eKfxP0NV75JyCStAP22RKb9tRwiAlHIb6G0pa7WFSVVbyN4xopnXDsNwVAMkyQO+tZVDMfxP2nsWwzv8eXySNgP6aJvHd1FQailmdPQYkSRnvDDPnchsEER6iac+2StYN+nf8WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zKSs7pgA; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e461015fbd4so3132999276.2
        for <linux-next@vger.kernel.org>; Mon, 24 Feb 2025 04:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740399442; x=1741004242; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vMvNtutvHMAptcP5aSgqQ3Rpg3q4pARtFCm/FUX2MJY=;
        b=zKSs7pgAQlNBQKzBg4QNmOiooFNHSRO8eOfv3qR1ZCdkKrGtB48apN+tRZ2QFuiPY6
         1HZ/Fg9jPa+nBsU8t7g52yTMgRpszAaOBn2cu6KzDR1oadlQW9UrHbtCxBFVRsFjaWeh
         /DOxuiu2NSOcOH9o4eyY5bLxw/BMoyMv+ci0XpQMdvxnHAbB4b943RUcoTnyMZfpiViF
         KWIe3VWscBSQ6KNEzPdAEuyawoVoxvAe7oege/GtS51drCTScU7Dhpx+x4Z6El/P8tQU
         cl7AXjmK1nnw9ewnuRKuYJExvob3kmy+wzahODKe/r5Aq5BHIVRw/nbm9E6UlIlyUzX+
         aAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740399442; x=1741004242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMvNtutvHMAptcP5aSgqQ3Rpg3q4pARtFCm/FUX2MJY=;
        b=IPj01fPVnHzIpqafqbtipSXHXiaLsuYqtreO4UWF8Y9MdUJgAzojJs553DEepOqCSG
         R97a/CXlfjYS/JTLKYlCsSflLFniVUBBubOv278z1ta9Zq73lFivX/EcaC4f+766FOZa
         HOdky8MzhnURErSFYf+sVdp9SxKHZ288/6A5OJZSPrSZv49g37UZ2fFAzsFj/Gsy+fT2
         TbxvGLADj4l3saIvJ5iJ+YaSV6dXvU4vFBXo8t2tKASLIRTPlUq7I0HHXYHH4dO0uD3P
         s9nG/5vSVVMFFutZDlTm0a+O9IECCLIE9nzH6F7D4/1juUiZg85IO6boXfJtSb8f8LXz
         U+Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXU/fk9FrGb9YpwOKGn0s+qcDStozbkuiB4ieM2+jurWAYZP+xaCSC3K6LvkbenTtVKsZYnOOUVOBQz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf4VWmJ9AStmN/2u9wOVtUTa8hiHMNYjUIl8t38Ue4/VvtvXJg
	XTDWJdFji4XkikltA4Pl7DdOR+wh7cH8hMwzP1ElYOylW5dt7VpnOqoUxKkwqqhTxu3k3bXZiT+
	l2RQOlYD5AI+E3V2Knwzpjdh0YUSyfEBIXiBnRzQsV9TcrItMnuo=
X-Gm-Gg: ASbGncvE0BrITQ85IkialIZQLcLSPy/wCr4HEcaAvswvGHU+e4+xDW4bjaiDac79uuH
	DU5whZy5v9bcKTOVqsB5+ZQcPZSB1V/siJ3XeglLPD7NaKCqA3w1roxwQFJbZoT0/LVQa1vWUGt
	GqW8cKOzFj
X-Google-Smtp-Source: AGHT+IELOk5ZXAqmoOudEZqUSDKLpqR/4L/Z9SA60povjeh84JPDLDRKCUYn0cTHIiydrsnhjz9f0XWowWtSem6OafA=
X-Received: by 2002:a05:6902:2845:b0:e5b:3af0:d4a1 with SMTP id
 3f1490d57ef6-e5e246880f8mr10067451276.40.1740399442088; Mon, 24 Feb 2025
 04:17:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220113338.60ba2290@canb.auug.org.au> <20250224122318.228f695c@canb.auug.org.au>
 <20250224162048.7806bb1d@canb.auug.org.au>
In-Reply-To: <20250224162048.7806bb1d@canb.auug.org.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 24 Feb 2025 13:16:46 +0100
X-Gm-Features: AWEUYZksBg3IE74M1moVSjQJhnuSmrxpg_pv5byEOd0zI1JVF6jP9rg_85gkz_M
Message-ID: <CAPDyKFqBwari-MoRefG82kbxovVaLt3ewRVFihHoLbrOSWSnMQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pmdomain tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Feb 2025 at 06:20, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Mon, 24 Feb 2025 12:23:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Thu, 20 Feb 2025 11:33:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the pmdomain tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > x86_64-linux-gnu-ld: vmlinux.o: in function `rockchip_do_pmu_set_power_domain':
> > > pm-domains.c:(.text+0x19aa103): undefined reference to `arm_smccc_1_1_get_conduit'
> > >
> > > Caused by commit
> > >
> > >   61eeb9678789 ("pmdomain: rockchip: Check if SMC could be handled by TA")
> > >
> > > $ grep CONFIG_HAVE_ARM_SMCCC_DISCOVERY .config
> > > $
> > >
> > > I have used the pmdomain tree from next-20250219 for today.
> >
> > I am still seeing this build failure.
>
> And now that commit from the pmdomain tree has been merged into the
> scsi-mkp tree and so the build failure happens there as well.
>
> I have used the scsi-mkp tree from next-20250221 for today.
>
> --
> Cheers,
> Stephen Rothwell

Stephen, thanks for reporting and sorry for the delay.

I have now fixed the problem on the next branch as well on the
immutable rockchip branch. Martin, please pull again.

Sorry for the mess!

Shawn-Lin, no need for any action from your side, I have taken care of
the issue.

Kind regards
Uffe

