Return-Path: <linux-next+bounces-1542-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 013AD875832
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 21:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AA8DB24557
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 20:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1021B1386C5;
	Thu,  7 Mar 2024 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z9qYltEc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835C51384BF
	for <linux-next@vger.kernel.org>; Thu,  7 Mar 2024 20:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709842973; cv=none; b=aAcPAW9+13XWqrJ66mYaoiaEDYLJ/02COFr4ftqPK3sfe3+qSqeKBzWEVz3pLz9coplVTNqWFID84rChMJ8LBwjuTpVdOjFpjssVzZDexDu9i8hfjjBfTsOL3cuw7Ctz8rb79uD19+ekoUsW+uZSo5MlE5GBw/gnYUcV0/Q8uuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709842973; c=relaxed/simple;
	bh=rsRY4KHhOJ11hCtZ8v0Bh9J/hZ5MuHy4e/+hy4b7p7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3ZtIihP8CB3BZrk8N0bPecnlUtxP/jZPIRbKJXN5asBaTmU5bVkvSH4yzRWfyi5Q5aqns39AYFi4bzd3Xz54vNjAPf23wXCmgWQUNxXyu/8AFWbdGapPx6Uw/Yq1ucMvA7/CC9yYZjJv2bDUUAG1QI2xnFJNph5RuYtCRR3290=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z9qYltEc; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dcafff3c50so10238315ad.0
        for <linux-next@vger.kernel.org>; Thu, 07 Mar 2024 12:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709842971; x=1710447771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gj7oOuwiWTs3D3sNhRN8A6+8rBskvEU4W316SxnrZUQ=;
        b=Z9qYltEczee533bhL6XcuFl3TuMK+ESAhilan3P4tEKBrRuWu4xMSw2AVzsiGFK//K
         Iv4JNewp1DzM5TKsoI+f9U+O6uxYMjMrNvITeoy+wMIfZRv7MEcUOrU73oQHCWG8JRim
         EFrot9hhxqtP59O9lGYQT7iMAetLMkhmdVsb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709842971; x=1710447771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gj7oOuwiWTs3D3sNhRN8A6+8rBskvEU4W316SxnrZUQ=;
        b=LCdiBCFUTzib3UMPq5aLmEWvP7uSzj8uf1vEktivO2QOrI1l1XXSlSjzR4W5Z+vkWx
         BdLvTEOuk1jWtfLc/uCWjdeLCaVP4oIJrhq0pLsDW9l+jGdOmNsIVuOQ7coJFohcsjY+
         njtCrbIgmAh4VlokWaYlqtrX67zLpT5v6KOSWYwzZQJYK5X0YjbiPhDfKMuwCpTKCj3U
         0uDeBIglfm8/431VGoAEbiY2/wp5eAFtIB1kaDy5axWeUK3pcM6oKcIjymjuK7k30AeD
         U++u7NlhZOslUbbVGHIWEBeetvX8niY02qrtNsG6NwLh1mlh62lJF6bMCAsje9TmaUJH
         6Cdg==
X-Forwarded-Encrypted: i=1; AJvYcCVw9/KO3s5bhj1xCtuOp0HfPd7PhNOky7WiYvVKvaea2WUE6lWT872fDvgKoV9fhkukBp4p9geROJhJ+f92WGnUU6tViyWFfEtgvw==
X-Gm-Message-State: AOJu0YyZVQEmdlr8AU69LzUugHwH34LuiiE4PIEXk7peF95MSyOSzwWs
	/5crck1bkoNz5Ori4LHFcLS9ntruXM+74lz/eDjW8uCwp49EO/gNsIVqNuKh4g==
X-Google-Smtp-Source: AGHT+IEaVq/z1Ao7qbCydAde3vlTjlckhexdCldutHJ7sK0OKwFxXDLmqCrbxxaDdS2K2YLHyqccRA==
X-Received: by 2002:a17:902:e84f:b0:1dc:3c3f:c64b with SMTP id t15-20020a170902e84f00b001dc3c3fc64bmr10989479plg.24.1709842970750;
        Thu, 07 Mar 2024 12:22:50 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902680e00b001dd62b4dd7asm581604plk.47.2024.03.07.12.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 12:22:50 -0800 (PST)
Date: Thu, 7 Mar 2024 12:22:49 -0800
From: Kees Cook <keescook@chromium.org>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: Jameson Thies <jthies@google.com>, Hans de Goede <hdegoede@redhat.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org, Benson Leung <bleung@chromium.org>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: ucsi_check_cable(): Null pointer dereferences
Message-ID: <202403071216.DD2F952B@keescook>
References: <202403071134.7C7C077655@keescook>
 <ZeoggIXSLy+lVHP1@cae.in-ulm.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeoggIXSLy+lVHP1@cae.in-ulm.de>

On Thu, Mar 07, 2024 at 09:16:00PM +0100, Christian A. Ehrhardt wrote:
> 
> Hi,
> 
> On Thu, Mar 07, 2024 at 11:34:21AM -0800, coverity-bot wrote:
> > Hello!
> > 
> > This is an experimental semi-automated report about issues detected by
> > Coverity from a scan of next-20240307 as part of the linux-next scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by commits:
> > 
> >   Tue Mar 5 13:11:08 2024 +0000
> >     f896d5e8726c ("usb: typec: ucsi: Register SOP/SOP' Discover Identity Responses")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1584245:  Null pointer dereferences  (FORWARD_NULL)
> > drivers/usb/typec/ucsi/ucsi.c:1136 in ucsi_check_cable()
> > 1130     	}
> > 1131
> > 1132     	ret = ucsi_register_cable(con);
> > 1133     	if (ret < 0)
> > 1134     		return ret;
> > 1135
> > vvv     CID 1584245:  Null pointer dereferences  (FORWARD_NULL)
> > vvv     Passing "con" to "ucsi_get_cable_identity", which dereferences null "con->cable".
> > 1136     	ret = ucsi_get_cable_identity(con);
> > 1137     	if (ret < 0)
> > 1138     		return ret;
> > 1139
> > 1140     	ret = ucsi_register_plug(con);
> > 1141     	if (ret < 0)
> > 
> > If this is a false positive, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make
> > sure fixes get into linux-next. :) For patches fixing this, please
> > include these lines (but double-check the "Fixes" first):
> 
> This looks like a false positive to me. The code looks like this:
> 
> 	if (con->cable)
> 		return 0;
> 	[ ... ]
> 	ret = ucsi_register_cable(con)
> 	if (ret < 0)
> 		return ret;
> 	ret = ucsi_get_cable_identity(con);
> 	[ ... ]
> 
> From the con->cable check coverity concludes that con->cable is
> initially NULL. Later ucsi_register_cable() initializes con->cable
> if successful. Coverity seems to miss this and still thinks that
> con->cable is NULL. Then converity correctly notices that
> ucsi_get_cable_identity() dereferences con->cable and complains.

Ah-ha! Yes, the ucsi_register_cable() check seems to have been missed.
I think it's confused by:

        cable = typec_register_cable(con->port, &desc);
        if (IS_ERR(cable)) {

This isn't IS_ERR_OR_NULL, so it thinks cable might still be NULL, but
there's no path through typec_register_cable() where that can be true.

Thanks for taking a look!

-Kees

-- 
Kees Cook

