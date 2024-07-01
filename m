Return-Path: <linux-next+bounces-2762-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D7691DC15
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 12:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F9D71C214B7
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 10:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BA512B163;
	Mon,  1 Jul 2024 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BhtmeHKb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D21985956
	for <linux-next@vger.kernel.org>; Mon,  1 Jul 2024 10:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719828537; cv=none; b=BCMFwwqXy9Y2cWGrJQ4OcHxk23BVnykRJYdINBfcFwbaz/nIX0wpLjUyC4h6y3w1vw8zChOm+TklzQOFKrJq2FKpil0kDsGgLpenH6vilHcfsofOSOzZjrMP9ChVAILbKI8pWl1eXWPLwlzWI+y1484vqA4KggqTpnYomwf3FEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719828537; c=relaxed/simple;
	bh=Aa++gCLn3lD+NqzuYFw3VYIsdm8ZENJyZaQkJnhuZ7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cunC8slxTxEOQ29bjI2wMm5zFz/DR9OGifhmqhdWauFQkuvwVX8zWdgkd7T4VM9JQLLlSjMibq2Uwtpf4qC+LvlcpXl21qQLYd2+cnHLC+KfTiyLdJbJJOISHk7DucHMTnlKONBxSAXguQZ2mnUv/a340xU0o7EjB9caRSc8ZeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BhtmeHKb; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-64b05fab14eso24415757b3.2
        for <linux-next@vger.kernel.org>; Mon, 01 Jul 2024 03:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719828535; x=1720433335; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NycmgRDsq327D/ssa2zH2umzDutW5jKnX1XFk2AIiOQ=;
        b=BhtmeHKbx7UCJOdCGlQI5WZyphmtyTgNXgMruzAXfr7c8kHkYCW3rrcqY0Yvlf5LB9
         VY+xtgQEESVNUOV7J8bwOsqjJ9ptgWgObwHviZTYTDCvf4HPfi2sUYGfrfUSypgJF4bE
         IcgQKY5H/3O8+7Dx7V8m7GvvEsZjeE1QakxvTTscKEe/rGYjXiLYIONIqO4QFJJR8DVx
         WqjOBEd5kposlpy7wRi8jPdN6r7DCBTuzD+orwImXa3LkIeuDTdwLWqc5TEHu++UmNfd
         B0GX5G6ngDC/isHkExBW2bjdv6roTggNWUfE9qtqY3Ly4gxyYWtKYD3lLil0IJFhGYsr
         /OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719828535; x=1720433335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NycmgRDsq327D/ssa2zH2umzDutW5jKnX1XFk2AIiOQ=;
        b=UQuFrhswLoJYX7RkQmFbUTBlovpKLvvQa1ldI+t/bSocUOhJDBPTgf5a/lEvBiAhcq
         xLgN20LSZJtlhaOThCGShisadSB3rhLI8Mb6479S3cVTJqV2m3ez3zqE/gxiImEmBLhj
         v0fSmv5biLe9jK+nFC6utrzjnwbeypyIm9yWdSWqlhT5/dBnP+Fw3rwleUKvBcm5CUXS
         fzKHIaKoHKqHb+fkAc4C2bc6Zyc9/dfNC7twZtVhzt2yGysZj6rVayEDRSvgY8ZGRNbT
         Jo0JSm8aeuiXJnLb7nKFJzyV7wzpqB96gy2rjO8sgAcU7LwSrS+5gROcgcnBIRQu/1Ee
         jDfg==
X-Forwarded-Encrypted: i=1; AJvYcCXckuQKoBySr+Coo1dh8xV/hUQoEBq8IXiISrbAkSzg5y5gV8PvHfvUsHat+cuJBgUumd0J9dtmTVIiythhn5XPN5ipZJYd5alSZA==
X-Gm-Message-State: AOJu0YxUBmfYf088kY35+63j9MxYO2iSkMl45g+mHdEyc+Yvd/Km0dWu
	il5IFlwdBpXIr9EEAFsltfc7EYaG84dJ9HUxIU2VeCUTyGbZOTxdfEYOPdppJnazP7bSKNTaURg
	DAGzW0Ef8IlUNgfjhVWlmdIX3r1gv4+7OXG62kw==
X-Google-Smtp-Source: AGHT+IGwi8WafEVjmBObOnzPp7tJ35c7X+EGOliYOe27SUZqWJxtxBxMEXMJreOS27yNOad4E5WT+Ba5yGrNIupy4u4=
X-Received: by 2002:a81:c441:0:b0:61a:d4ea:b856 with SMTP id
 00721157ae682-64c7277ca98mr42261657b3.40.1719828535353; Mon, 01 Jul 2024
 03:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZnxhiKAYvoqNIywH@sirena.org.uk> <20240701172655.3db48d51@canb.auug.org.au>
In-Reply-To: <20240701172655.3db48d51@canb.auug.org.au>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 1 Jul 2024 13:08:43 +0300
Message-ID: <CAA8EJprxGyEK-1jXBJOmBT_+VDyEKD2DVN8shwan60GO5-dopg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rpmsg tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Chris Lew <quic_clew@quicinc.com>, 
	Steev Klimaszewski <steev@kali.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jul 2024 at 10:26, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Mark,
>
> On Wed, 26 Jun 2024 19:44:24 +0100 Mark Brown <broonie@kernel.org> wrote:
> >
> > Hi all,
> >
> > After merging the rpmsg tree, today's linux-next build (KCONFIG_NAME)
> > failed like this:
> >
> > ERROR: modpost: "__auxiliary_driver_register" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
> > ERROR: modpost: "servreg_loc_pfr_resp_ei" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
> > ERROR: modpost: "auxiliary_driver_unregister" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
> > ERROR: modpost: "servreg_get_domain_list_resp_ei" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
> > ERROR: modpost: "servreg_get_domain_list_req_ei" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
> > ERROR: modpost: "servreg_loc_pfr_req_ei" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
> > ERROR: modpost: "auxiliary_device_init" [drivers/remoteproc/qcom_common.ko] undefined!
> > ERROR: modpost: "__auxiliary_device_add" [drivers/remoteproc/qcom_common.ko] undefined!
> >
> > Caused by commit
> >
> >   5b9f51b200dcb2c3924 ("remoteproc: qcom: enable in-kernel PD mapper")
> >
> > and likely others, I didn't look too hard.  I have used the tree from
> > 20240625 instead.
>
> I am still seeing this build failure in the arm multi_v7_defconfig build.

This should be fixed by
https://lore.kernel.org/linux-arm-msm/20240626-qcom-pd-mapper-fix-deps-v1-0-644678dc4663@linaro.org/
, hopefully Bjorn can pick it up.

-- 
With best wishes
Dmitry

