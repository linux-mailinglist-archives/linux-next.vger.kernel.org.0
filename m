Return-Path: <linux-next+bounces-4795-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F39AC9CFFA0
	for <lists+linux-next@lfdr.de>; Sat, 16 Nov 2024 16:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8C6D28150E
	for <lists+linux-next@lfdr.de>; Sat, 16 Nov 2024 15:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CD47E105;
	Sat, 16 Nov 2024 15:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PobAToZB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D0B17B402
	for <linux-next@vger.kernel.org>; Sat, 16 Nov 2024 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771643; cv=none; b=f9+LwzaU7YFKxMvB2TvdkcDnxKsu6FZibE3fCU0cCRoGvC9CfLW3W9dCUXZmO3XHDqf+8tJO5lt/WLlcBy1igBtbcqTYpRNTaWpjiXritRMcAMWZb4FA0JGs5jmOnTaiTrzfnC0QLcFNNpbkYFvXang9JTL5bojIbANi+q+zobU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771643; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=gXbASskoarm1e0n5ZUZx5kkeTGfH9jDjJQ6o8JFOkrGyQsztHF4ZW2hYaWlUUwF0SqAF5vt61UoN8MIiwtm90EM8/qEW8mCr50pj/wcCxlhexAgreRH1Y8AMMyduG4bsTLnsrv2VL9uce1L/xRGIr6XJJ7rOxSrNVa2xaxf2Exc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PobAToZB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-211c1c144f5so21014915ad.1
        for <linux-next@vger.kernel.org>; Sat, 16 Nov 2024 07:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731771641; x=1732376441; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=PobAToZB5VQcuCsYtgjTD8m1Q6rPJDNXFRKk6BKDwUic16f5o1GuQnfguz2agbwZsq
         aIiOhcQoxoIKbgze5auuUi/NatkXQAxhF0AHomr1xcmQ2awHW4DYDkNM18wTUZZxt443
         hPqLFdz4iHQ0Aiimux4KtVhpwcQm4yU6NssndVD+9L49eEk2Dj0/Rq1JbDwrC4eCcbKB
         EVhNM/amucUCb6b6ArLaPSpc99vXWhAm2LKSMweHT3zCzH8bRMyVJNJtUDDgbSwQgkQq
         kUEMvlDY1OxIZ3PQgog/0dKPLjmerY5o3xx2uAUDIbeNBe+U6aII7tW1dcQeb6g5usUQ
         smTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731771641; x=1732376441;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=tCyOtGKA5W9a39TfxCwfuSkPU/N6Z/xK4iMbwNDtgsQh9QtcrcMVDPF5LHSYLPqjPR
         coFDeVASWhUCWaWdG92rc3FDiyB399p4AgLBys3RXWtACljM3ReHr3ZJ8IdRfdr5IsfC
         pXGZD3zVO15XrwdgSwjIKmgxle14vIj6iYsUQ8h/9/WaX9zYmWoafsX3nJ3sHjlTKmne
         BCmnKTjpkaMFnbU+2r0NzthhcDntJy+4bn0zSSrk26V4J/5FJ1lpDChLtk6jqwQU++W8
         D2NiL5ujk9z4r2T/rqEQIOwRoa9P80nyWNOONCB1R/THs6c4RxHqYroeg+ewU3fkZWHa
         4apQ==
X-Gm-Message-State: AOJu0Yz8AAUZQM+0E2NOB9hYo53Q7k+S2cxeo9SBfdguj6T5DuMmEtjd
	awqYUUWMOgW1miyle8KzGdGQKCAmSLUpduukw6P5KKL9uoa8hy5nrrr/yg==
X-Google-Smtp-Source: AGHT+IFRPHA/QRvIH0UQ0Fh2seCfxUGzRY3oDAje4ReEN0FXfV56cF9aonUwGfhnEuL1rC+yjtkS1w==
X-Received: by 2002:a17:903:40c8:b0:20c:a04a:1e22 with SMTP id d9443c01a7336-211d06aae11mr114039355ad.5.1731771641404;
        Sat, 16 Nov 2024 07:40:41 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0ec7fffsm28961155ad.70.2024.11.16.07.40.40
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:40:41 -0800 (PST)
From: "Van. HR" <akechjuombo@gmail.com>
X-Google-Original-From: "Van. HR" <infodesk@information.com>
Message-ID: <6c0274ba672044502a3e237cee6ab9940258d48cae2ec2803f1dfaf54a32ca76@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: linux-next@vger.kernel.org
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:40:38 -0500
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.


