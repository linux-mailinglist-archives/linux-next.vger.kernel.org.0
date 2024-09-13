Return-Path: <linux-next+bounces-3851-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7B9978B68
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 00:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8C5EB21377
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 22:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABBE1714BA;
	Fri, 13 Sep 2024 22:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4nIyWMo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D841714B3;
	Fri, 13 Sep 2024 22:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726266473; cv=none; b=Ue7AEfV5mPTjlb3xRMCczemh3AuuS8U07yhgqSO9l0DUY7q3yRGL7357sYsNXDmwuCIgB38hEYu76vD8z8zNM9wPHyUOaa9tzMwo8KfqqKTmTp8xuM3M7x6sdCia9A+X6Ll78okaVA38rZ6VRxEofNu81CMD0JS3r9wufrHlj+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726266473; c=relaxed/simple;
	bh=lxb3BoZDQms8OKURRX9JELRSCUvbsZab5d8hqGSlhxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bw8uNqbb8iHcieQ4TcHWSvXDQ0XCAmZrj9hlkIByQ8eJ9wFYsypkyF+l5UMYmCffyscoVAjNNVyxlx4GgkqaC5TzgBZ/GrW1NDv0QaFEkehp9+9isT5cgt6VICgxnav+DZLaoXTcKzu+2nWREjZDR3EgDZ8nuB12eke5C8H2ru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4nIyWMo; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7db233cef22so1031698a12.0;
        Fri, 13 Sep 2024 15:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726266471; x=1726871271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ho4A2dlkxLyKDzVyfgfjhOPRDsg2t0/XpGUELeP46ZY=;
        b=E4nIyWMoXHuao1CDMIUj2kLDwNWanXXlSDdBDXNTdr5YUcx7dITIF8ReXuFz9HJiA9
         mMVcZLNe8rGB5IXnt4j1g9xVYWrjOXI0FHF/hPz+ctRBNZ6yNESW+cz6+3PcPhps7vXS
         5ns+iVSH4VYtHzehcYolimBh762iyjiMyw3A4ndfemGkeC+2dO/KofK5qBvOn1oMWhHi
         kj2dAPb/797UGoABGYE0oZbPcDTsfqQKpCc5Rk7iYuyff6KLsdG3yjjiOfyB9E+BCJy5
         7FIRQdyeQCgRTxzrUPo61rJQUFxhlFpjFjCWwg617WQNseERMRF366FKu8HYvAj5G9XB
         29zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726266471; x=1726871271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ho4A2dlkxLyKDzVyfgfjhOPRDsg2t0/XpGUELeP46ZY=;
        b=H0gT1RBQ2n2Hp+kP2YQZV4ufg5Y2RucG1bFHYZK8mE3TnpcVBI+MEiYFk9xM/MX5ud
         NO/X46yef223aLd+ksc43ubSU9a+NHvpSlJ/r+hZoCmGzP7GjfWACArDEU/ldTXz5QxO
         SyBw66Tjz4uD+ifLm1NmRljLpE7y9QjwCHu4a4mlfjmzjNcbZKdF1jKw1YHisd3y6QR+
         An+d7ntdit539ugfk/WCOOPPedJ+qC14/3xUPyoACQ9j8ciS2Xs3tk7/CKEZkcXh69eO
         aBUbjSr1WwiCcyEiXa8yMxAvoEXu31hSTtfjiFBM4XZIkuP/PyRFA8G+/azr6E1NeyXE
         G9kw==
X-Forwarded-Encrypted: i=1; AJvYcCUr2zosSd9GQ0j3GVk+tbj8vyMl8ofeRO18yu0lo3onbpP5LFGB6dUAMTLKk5u+szO1BGaPuL8ng8bqSg==@vger.kernel.org, AJvYcCWC98QxKGiGg5rux7vhgcv1RH2mXETQJhVnUmjLck8YOJxla2fC64/iqvrMLgPTKlegaBHUlCCS@vger.kernel.org, AJvYcCWwnqKWQXvK9fFqlvAMKJA5Vpy7EBcr2y3eq6ZhfYS0NJ4cPMB+MFjCxth8cj6yiSKkC4XiCABSB6Z5q/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5QY6A+1aWA4hpo2atHNZvOdJijT9P2ISvndoJWtqaOxph8Xlj
	4cRPZflG70MSUm+k2uffovmU27u8A0AoWt5cHYI73JzRfd/ejOU=
X-Google-Smtp-Source: AGHT+IGMD6FwApmJ+MqRiyYkS+omxKRFa7rqnD3JQ7w575O5kdRxfkkNpa2MsAfMisPRNr5f5k6EvQ==
X-Received: by 2002:a05:6a21:3a96:b0:1cf:3e99:d7a7 with SMTP id adf61e73a8af0-1d112b60cdbmr6984887637.12.1726266471397;
        Fri, 13 Sep 2024 15:27:51 -0700 (PDT)
Received: from localhost ([2601:646:9e00:f56e:2844:3d8f:bf3e:12cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a97574sm80042b3a.31.2024.09.13.15.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 15:27:51 -0700 (PDT)
Date: Fri, 13 Sep 2024 15:27:50 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <ZuS8Zp_iiMfi0PX9@mini-arch>
References: <20240913213351.3537411-1-almasrymina@google.com>
 <ZuS0x5ZRCGyzvTBg@mini-arch>
 <ZuS1u8G6M9ch2tLC@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZuS1u8G6M9ch2tLC@casper.infradead.org>

On 09/13, Matthew Wilcox wrote:
> On Fri, Sep 13, 2024 at 02:55:19PM -0700, Stanislav Fomichev wrote:
> > On 09/13, Mina Almasry wrote:
> > > Building net-next with powerpc with GCC 14 compiler results in this
> > > build error:
> > > 
> > > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> > > not a multiple of 4)
> > > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> > > net/core/page_pool.o] Error 1
> > 
> > Are we sure this is the only place where we can hit by this?
> 
> It's a compilation error, so yes, we're sure.

We also have netmem_compound_head() which does page_to_netmem(compound_head()).
Wondering whether we'll eventually hit a similar issue over there.

