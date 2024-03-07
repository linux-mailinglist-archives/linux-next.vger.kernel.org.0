Return-Path: <linux-next+bounces-1540-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D8B87574E
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 20:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D36B2287DF3
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 19:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6D713666E;
	Thu,  7 Mar 2024 19:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e28jsTOA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27641369BB
	for <linux-next@vger.kernel.org>; Thu,  7 Mar 2024 19:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709840064; cv=none; b=j3Kyfab9X+blQj3mT6CvJoEYm9xeSSSGJ+LwNd/byat0OsZKMKl+QWyIjOSvZOK9FoODi/hCeIxF9OknNHlJmGvlbM57WZzwaURQt0TXy14hfX+UujKw5jl2m3cbMb9NixvMvDUN+MUw2AD0NbrZqhkDeoniH9e7PMFkfns9TLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709840064; c=relaxed/simple;
	bh=Kfej+LHgbQK/sCIhdJwBilxV00+UrdCsx4d2kwtAhzI=;
	h=From:Date:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LxdiWPqv1ZeZfAhu67ZMEPtqCcV3DJYLke3lIIxctq9HazlPaQip0lUv9UaN9wNgqUI6WQiz9fKiuz8wPe40uN+H49LVeApZCr9F0NK1C53WGcdHkalZ90mxAfA6vBSMvUILL1uHWh5y3oJkf6K6a0p+10qgeY64OCnzqGnqVnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e28jsTOA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e5b1c6daa3so65958b3a.1
        for <linux-next@vger.kernel.org>; Thu, 07 Mar 2024 11:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709840062; x=1710444862; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PVily7FU6GJy5Nkk5KN77VrVoGkvWQzL6/vzQKnhzA=;
        b=e28jsTOA8z8eleeZBjLe98kX/vXrI3/BL2Ut+ZpkaOR3xT3cBjHFCGU92TIPdhqmlh
         p4I57xCdRxLYN6GKMQmw2KA6wc0SKSY7LFn6yF7Q+wfoDLFC2gKtYkTG1zXUeAah9FnP
         2vuvLOQWh52Tw0fENyYyNnhf8gx18u+bqvU9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709840062; x=1710444862;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PVily7FU6GJy5Nkk5KN77VrVoGkvWQzL6/vzQKnhzA=;
        b=VDEIwdtoAiOMAIwIgS43O8ZzHd3IC/bdeMSsq6asF1nE0djnu37CP7mgIiNHDeaC9y
         E4a2LSRRJtyY6/Y0KyeWfE8DCVZa+AlJRyr+zoDmAg8geM0tBCT7lmDaAu8xkEGsDHbe
         NQS4URoNLXZdmzLCekSbCIDWjR24I7nQaH72J4coitj8vmoxL1Mc7uSKVBjqovMeqOC0
         Q79OL76wsph70LlCt/PuWarynC8pLoUfrwQ8E/WPXYBdPld3DHTB4AYuTgwttwd4dNsW
         VRqbz6RKRHcErVxSbzZ4ypJfTk5tmUT+2zPX3H8IHK2XJZrEx+DwdxN3zAcclqf8LC0/
         +I3g==
X-Forwarded-Encrypted: i=1; AJvYcCWNMFVeQunvr0loch3pkgglH5IYKpXrl4tIQko1U9vg+YUMgCpDe/P9Kqznrua8pFYAm6mK3jebZM7HfmjdfMP7XBK148r4t0e2Og==
X-Gm-Message-State: AOJu0Yw2r8IvT8QUQOqIFuV5jYXFAuRF/vv5BNJkFt7m7eZ20lw4c8HR
	rPpPnR613nMbDmorw2hEDwmVcBWKtMOurooPveVjEDsDTIvWOakV/J1vzzrSAg==
X-Google-Smtp-Source: AGHT+IEjdEN4l+11c3hHPjNS0tI+JHVbAlNWjLu+uS0rLW05VOLz0gzCHzXvxynoZOoBJ/CXyuk7IA==
X-Received: by 2002:a05:6a00:2b44:b0:6e6:2af9:7553 with SMTP id du4-20020a056a002b4400b006e62af97553mr10534245pfb.5.1709840062303;
        Thu, 07 Mar 2024 11:34:22 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p4-20020a056a0026c400b006e65255b9acsm2725907pfw.49.2024.03.07.11.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:34:21 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Thu, 7 Mar 2024 11:34:21 -0800
To: Jameson Thies <jthies@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
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
Subject: Coverity: ucsi_check_cable(): Null pointer dereferences
Message-ID: <202403071134.7C7C077655@keescook>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20240307 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Tue Mar 5 13:11:08 2024 +0000
    f896d5e8726c ("usb: typec: ucsi: Register SOP/SOP' Discover Identity Responses")

Coverity reported the following:

*** CID 1584245:  Null pointer dereferences  (FORWARD_NULL)
drivers/usb/typec/ucsi/ucsi.c:1136 in ucsi_check_cable()
1130     	}
1131
1132     	ret = ucsi_register_cable(con);
1133     	if (ret < 0)
1134     		return ret;
1135
vvv     CID 1584245:  Null pointer dereferences  (FORWARD_NULL)
vvv     Passing "con" to "ucsi_get_cable_identity", which dereferences null "con->cable".
1136     	ret = ucsi_get_cable_identity(con);
1137     	if (ret < 0)
1138     		return ret;
1139
1140     	ret = ucsi_register_plug(con);
1141     	if (ret < 0)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1584245 ("Null pointer dereferences")
Fixes: f896d5e8726c ("usb: typec: ucsi: Register SOP/SOP' Discover Identity Responses")

Thanks for your attention!

-- 
Coverity-bot

