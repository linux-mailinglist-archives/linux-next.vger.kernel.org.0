Return-Path: <linux-next+bounces-2981-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2359D92FECD
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 18:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB4DA1F21D15
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 16:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389E4171E74;
	Fri, 12 Jul 2024 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5Y+KEyV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C3C17625F;
	Fri, 12 Jul 2024 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720803014; cv=none; b=hxXPNDDBnJM4eRHPkvTDCAph3yEVysEILEe29keAr40YToBPRadxc+lOKPw9i4Ajb/X6wLOs3ctVK0XWOyqdV4eBR0GPqOq0pzBJawUpnJ32mJh8tb4h7VsY5xMMyU9LQIlTHnI0Qk93ZBJslVor6Dx5YKL/btm+9wJGgUUH32s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720803014; c=relaxed/simple;
	bh=OxS8wazVVqS5xXl5NeoSIzC1nlAkWEwIpApn6EfcVHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9jT3i/zzKRJp3KJuIJJIOQQBlJOx0SjJq8Bs76EjYVvF47s6XQdrzKHtlij+TA6IQdAXmbmCMoAxa92eW0McfJUHREjmOy9p5mEBsywaOxbxTvlEMCZ0XovbX70vZcVgBSQXcU7C0a4HscCC94CW2EQmlsIhFlj0D8YkaxRkwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5Y+KEyV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fbc0a1494dso15818275ad.3;
        Fri, 12 Jul 2024 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720803012; x=1721407812; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rw1ODikYAXDGDDJVTdFN041z5klkxINFWWxX8df6FW4=;
        b=m5Y+KEyV5DQZT0S5ZV7Vr/L2qpDuEPnedr75Qo0U/BMJti1Z2wSxgr43aAyo9b0Z9w
         aLdbn6EGKh5akT84hk+ptTvKRnjstfq5OZJpq8wmj58x7+xVCPnxGNgwy/Tg5+bfh85E
         0wjBtyB6Hcl0PstbjVdSwid5fddZ3y1bKqkSgDE8wPrpuiXIkN2KtwuBlz2PXOgPyGt2
         de2Be19OJ/1AACS4Qz5hRKuZwpTJxtN4fjlDseOAFAwBOzuzsgF/JYCEqg0O3ftDF9rd
         NEyduouIsgJCXF2EA7fxaLkLFi8eI/gtn+BtjzNBHNgZyBo4FD+WBWc7Ljj6gh2aWXw3
         pjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720803012; x=1721407812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw1ODikYAXDGDDJVTdFN041z5klkxINFWWxX8df6FW4=;
        b=NbKM8wEPgF4PFmvsH354HJKB+aG5BDepP8OZc7r1HSQNK/a2TRRbxNNgHSlEjVirL0
         ZDmrz0eALeIwVNdwVjtNs4P8KVNvhafQEr3mYjqGlralq584fgiC0Z77DOiVtwx/TyM5
         6FUuy2bRUnmul8cKrao8YKU+vrGAaZ9zEuPOAs9O1L6WlscbcwUsB11xQFXZQXSMoUMn
         aqRBb21bfAWZc4QsAXu+drGOorXs1YmPpnOFMwMgTSm6Af96fB7ResvtrDV/BGyss8as
         O3B2XuZrvUniqXU3osXxVGsJMGvzcMPElIGr6SNL1O2D/S5/gU9atpmPJbQ77enLWoB3
         m9gA==
X-Forwarded-Encrypted: i=1; AJvYcCWdIvDIcB05l66oGN/5F5DRSMV9X2FuTXkSVazgkyaQUm5hbq52MWOw987MgoPGe8g/Pjw5Ip1NWBmoZlpEifHIucmxxlm6BEpKc52wmVTSt9Ih1rwNRMc41SkM03up8IhTN/Z5Q/6FQQ==
X-Gm-Message-State: AOJu0YxDtyurDy4XS57NLaWSI8uFINzDoQzNHF1PrlAavvaydq66rKlz
	+5ErDp6cwsMJBJ4p5raXK0KPVZ/Aejl+j55BYbJUaiCl8FSaTXS5
X-Google-Smtp-Source: AGHT+IGV2cwefoIo5L7xfIryWQzU+2TO8o8CdRDLuWjXfk3alR4avXYOCdd0btZBRJzqkKSQ8bxOww==
X-Received: by 2002:a17:903:32c5:b0:1fb:34ef:4467 with SMTP id d9443c01a7336-1fbb6d893a3mr100289045ad.43.1720803011912;
        Fri, 12 Jul 2024 09:50:11 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a1296dsm69505345ad.16.2024.07.12.09.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:50:11 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Fri, 12 Jul 2024 06:50:10 -1000
From: Tejun Heo <tj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the cgroup tree
Message-ID: <ZpFewkiv_s3lNvUk@slm.duckdns.org>
References: <20240712164354.65cb32bc@canb.auug.org.au>
 <20240712165107.7b46a640@canb.auug.org.au>
 <8734oe1xak.fsf@trenco.lwn.net>
 <ZpFdcteO8CeZ94Cn@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZpFdcteO8CeZ94Cn@slm.duckdns.org>

On Fri, Jul 12, 2024 at 06:44:34AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Fri, Jul 12, 2024 at 08:48:19AM -0600, Jonathan Corbet wrote:
> > > Actually my character map app says that it should be the two bytes 0xC3
> > > 0xBD in UTF-8 (it is 0x00FD in UTF-16).
> > 
> > As you observed, the patch is encoded in ISO-8859, not UTF8; that
> > doesn't fit well in a file that uses UTF8.  One could argue that Sphinx
> > should be a bit more robust, but satisfactory results will not be had
> > regardless.
> > 
> > An encoding check might be a useful thing to have in checkpatch.pl,
> > methinks.
> 
> Local env is utf-8 but I saved the email from mutt and then applied it, so
> maybe that's why it became iso-8859? Anyways, I'll fix it up.

I redid the commit locally and am seeing C3 BD for both instances of ý.

Thanks.

-- 
tejun

