Return-Path: <linux-next+bounces-6497-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39070AA6A19
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 07:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D21489C2F9C
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 05:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2981ACEB0;
	Fri,  2 May 2025 05:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SW5QYz6V"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512E9188907
	for <linux-next@vger.kernel.org>; Fri,  2 May 2025 05:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746163065; cv=none; b=goUxzAaGAuhIbYD6WQPoNFl0x6Jbsta7BzSJX4P0zRPq3gsM2wiJbCsjW4PS1ozgTkE7oybnBdQBaehP+hVqihzuA7fAuG3pT2V8pHZGWxV66MgP4uEdFC9kSE9APzOAeJQFfkKfBq0nZ1TUG/h4YAut7RLHmxzQXrCSRScz9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746163065; c=relaxed/simple;
	bh=Tn0Na7X3gzYJqXuQE25AJK/YZhEKlFsKU73wzI8Jb5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GA1x3jpBIMQPAZAH6b/I1bIziEhB0sXg9LOIFCclgR1JSZex7m2WSft2bQXIhFRmBGLuO0Sh3Pimp2fw2ASv9390SWPLDUleErNjRyjrpK2KNXcdUjt65FoAz4Sbl3VtJAf1e8djFOMGOcVUJP2Vb44cyHHKiC6wXSpztBEz1pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SW5QYz6V; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223fd89d036so19758225ad.1
        for <linux-next@vger.kernel.org>; Thu, 01 May 2025 22:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746163062; x=1746767862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xnngx+crBMNjpxjPvIvBmDP5Ck45rikGrRu1GyUpDTQ=;
        b=SW5QYz6VIwWAQUfprBjVsKIHcpx4/ckn3CMas+V3CxYV3dtQFLGpljiJqJ+LXrap+L
         7nfm4h/lQP2hzVUxQ6+A0XqDz0fEhsLPPH44/fCQds0LdC3JYsTo3X3EJITNuLm1WLtk
         t75D7Y47TU48cPsJlbslKmqp4vGwDIVaVUom+WP1YGntlm3aj2uhyI4FmpFDef2Z6vla
         DSJw99XYFVrR5PVmAyinzYitcdkVOiYr3Dv60H/pri8bF6bOSYeTII8+bjZ/Eh6SPFQ+
         UZ9tfE7XKASCNQty6C75ziS8lw5Oese4NGkeLHaI74Xp5B28Zz4WBVKrmZIoi/wt4yrV
         t+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746163062; x=1746767862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnngx+crBMNjpxjPvIvBmDP5Ck45rikGrRu1GyUpDTQ=;
        b=ffrIwYna1CPag500q+s9B16YafgdNARSrDOILDr43SslYpbEn9TR/3Kpdw0pcc7LEd
         T45Q6JZ/GIfZMElGzV2XwTkgCzkKvuoqog731OKIZ8Z8mHGq3M84QJTFlMVibqRSfBaw
         XhZF7dXBFgdJlX0NEoO2n9dKTJfzymnp14Jv1m/I/woio6yRcTzmrbH+F1R0sc372+lp
         zccke4RTnYR5kEp/aQUdRBh3PjDMZrmTmOSsCQpT1IprFE2eBTiQqU33IL+zsNGeErPX
         U50zCMI2sw+kGbO6U9HlUkzk5fp7iI4OXkKQ3DRGBRWulztTFoQsMg24D9FYTzSMvOa9
         AnQg==
X-Forwarded-Encrypted: i=1; AJvYcCWkriZYnZ+noOM6b7AwN+WtFO4+hYe3lBhjIwB7DeMxbz3frw/pUimasKTmw1Qi/Oc5u+IYwQHWWrrT@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNB5dzNJXmHqDNVRc3wGo5a5Zg71ZlW/DbC6gdlUcQR6Inaq3
	pBIXpz3f8e9q711Co+UKZvkiIfalNex1Z/lpkXZgYblrphqKxy72rVQE5R7UpDs=
X-Gm-Gg: ASbGncvnJVK8HpidmevJXxHAkrkXPkx3cLj/Q68/2Zurm5eWFUudoUscRqc98UI771N
	W4yfYWb4/nCsJuk4oEI/kTY6Vv/HKD8bWRS7SE7/b1nHMy+Xi0+gCWqCp9RYJcPzCTWb6vOhk26
	C1bfRW2Qj/zWtPALYIZcBtNJp/I0WFwA0dYHlDX26uq46HkuYs4sNo47B1sdoRkAGMrQIyvaLS6
	L8vZDCso7tzhjdS0Abq+fvRRGq0rvxFW3zc+7uz8CEfxDUb0zSjBa6bwe3S+0Olqg1d0HxtvHqA
	XWjIh/AhGpFDnZ46m11m52ELh9aiFidFQ1aWbSw6NQ==
X-Google-Smtp-Source: AGHT+IH0IRvfkSM8mpH4viXHOvhnL42FJ9fjj9CjAMUg3CpBdjiOxPHs0LObz/jU2wlHtEdIsfH6Ew==
X-Received: by 2002:a17:903:2405:b0:224:584:6eef with SMTP id d9443c01a7336-22e1038286bmr29293335ad.41.1746163062625;
        Thu, 01 May 2025 22:17:42 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e10942d07sm5463145ad.259.2025.05.01.22.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 22:17:42 -0700 (PDT)
Date: Fri, 2 May 2025 10:47:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
Message-ID: <20250502051739.d5ge6ajr2utwn4av@vireshk-i7>
References: <20250430202315.62bb1c1b@canb.auug.org.au>
 <2xUHqc3nyQdHW2SNbAQvQwy1mR4qz-vdR0UF8fVwFvm-rDtaJmhOUqJJvNWkneTh1XD58UlvoBT3umKbMjNlYw==@protonmail.internalid>
 <20250430104234.dmwnn5ih232kfk4z@vireshk-i7>
 <87selo1xdh.fsf@kernel.org>
 <CAKohponC_E9Ah4wXNNg0YVSo0UuRn+hNq+hxjrccbjeNKWH6Rw@mail.gmail.com>
 <20250501221958.00788306@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501221958.00788306@canb.auug.org.au>

On 01-05-25, 22:19, Stephen Rothwell wrote:
> Tags like "Acked-by" etc in the commit message will change the SHA.

I misunderstood what he meant earlier, Of course SHA will change with
this.

-- 
viresh

