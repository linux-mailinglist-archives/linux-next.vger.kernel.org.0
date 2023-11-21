Return-Path: <linux-next+bounces-7-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 275C27F33C5
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 17:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2ED7282D7E
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 16:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7175A115;
	Tue, 21 Nov 2023 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="FwqPqpsb"
X-Original-To: linux-next@vger.kernel.org
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D023D56
	for <linux-next@vger.kernel.org>; Tue, 21 Nov 2023 08:31:19 -0800 (PST)
Received: from eig-obgw-5005a.ext.cloudfilter.net ([10.0.29.234])
	by cmsmtp with ESMTPS
	id 5BpVrXj5BL9Ag5Tegrm4mO; Tue, 21 Nov 2023 16:31:19 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 5TefrL80x1b9N5TefrSud3; Tue, 21 Nov 2023 16:31:18 +0000
X-Authority-Analysis: v=2.4 cv=FLYIesks c=1 sm=1 tr=0 ts=655cdb56
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10
 a=el_zaujX9iDH7R9aTdgA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7CrKRXxwaxc41PDQ+3XM7MTcEtfrLzQtzjAt/JtViAY=; b=FwqPqpsbVsD/zWAVItmkLhZ8H8
	WR9QrGmhfDb6RrzvWl4sZ+eW7MmBbgBY6/YK4SvgGM/IquCEnXdBv5Bf2BJ+wlUnwNEGN8d37SMx5
	Qvnke2MiE8FpG4L5COIa6J3SDs6qsZoaLp2+GgW4NTnfBl5vAMqnX3kslwOjkBzus5cCrEBStbyu5
	lUTv8/oGz7g72855qHaj9ysBbUki6vc9ENWtHbulMP8U7QZEiUKd09P2sJrZv99iEVaaM2VbHVHCY
	Bz0Jk/jEUF6ppQTb4qF42mrfkcy6Ay+JAKSiOkuKX9pacqjxOfcdN+tTkL2wBNtGGNg/0DzvPyKLA
	sX23VM8w==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:57028 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r5Tef-002iJo-0f;
	Tue, 21 Nov 2023 10:31:17 -0600
Message-ID: <26671a7a-c3ed-448e-a220-108516a50deb@embeddedor.com>
Date: Tue, 21 Nov 2023 10:31:16 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231121131903.68a37932@canb.auug.org.au>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231121131903.68a37932@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1r5Tef-002iJo-0f
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:57028
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAxMcZ1JJlqVPPv7mtKZ0BlKmDGsPyFFVfs+DQVb8xfQdHZCocWQjY01HcFp/IBVmdJ8mpgHnPiNWtP0VvSWYDGJ1EAEQ0mzzmyJMh5XfgLZoCWsWK2y
 2BiVN7eg6OwpyxVLLJEEAdjeSWvI3YQJDAmpyhrzv/Nh2BJjool8UzgoHPy3Jpp75iSd5gz2GMZg2pWuqd9qiD9bguM5sAPDvrFYN+PsHyzV+ZcjY9NYlLmz

Hi Stephen,

On 11/20/23 20:19, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp-gustavo tree, today's linux-next build (powerpc
> pseries_le_defconfig) failed like this:
> 
> arch/powerpc/crypto/aes-gcm-p10-glue.c: In function 'gcmp10_init':
> arch/powerpc/crypto/aes-gcm-p10-glue.c:120:9: error: 'gcm_init_htable' accessing 256 bytes in a region of size 224 [-Werror=stringop-overflow=]
>    120 |         gcm_init_htable(hash->Htable+32, hash->H);
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/crypto/aes-gcm-p10-glue.c:120:9: note: referencing argument 1 of type 'unsigned char[256]'
> arch/powerpc/crypto/aes-gcm-p10-glue.c:120:9: note: referencing argument 2 of type 'unsigned char[16]'
> arch/powerpc/crypto/aes-gcm-p10-glue.c:40:17: note: in a call to function 'gcm_init_htable'
>     40 | asmlinkage void gcm_init_htable(unsigned char htable[256], unsigned char Xi[16]);
>        |                 ^~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>    167820dd258d ("Makefile: Enable -Wstringop-overflow globally")
> 
> I have used the kspp-gustavo tree from next-20231120 for today.
> 

Thanks a lot for the report, again!

We are pretty close to enabling this compiler option, and it seems you
are catching issues that neither 0-day folks nor I have caught before.

I wonder if you could help me catch the rest of these issues by disabling
WERROR (so we can get all the warnings) and letting your builds run with the
following patch on top:

diff --git a/Makefile b/Makefile
index ede0bd241056..596c33e6319b 100644
--- a/Makefile
+++ b/Makefile
@@ -982,6 +982,8 @@ NOSTDINC_FLAGS += -nostdinc
  # perform bounds checking.
  KBUILD_CFLAGS += $(call cc-option, -fstrict-flex-arrays=3)

+KBUILD_CFLAGS += $(call cc-option, -Wstringop-overflow)
+
  # disable invalid "can't wrap" optimizations for signed / pointers
  KBUILD_CFLAGS  += -fno-strict-overflow

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 2fe6f2828d37..1527199161d7 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -106,7 +106,6 @@ KBUILD_CFLAGS += $(call cc-option, -Wunused-const-variable)
  KBUILD_CFLAGS += $(call cc-option, -Wpacked-not-aligned)
  KBUILD_CFLAGS += $(call cc-option, -Wformat-overflow)
  KBUILD_CFLAGS += $(call cc-option, -Wformat-truncation)
-KBUILD_CFLAGS += $(call cc-option, -Wstringop-overflow)
  KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)

  KBUILD_CPPFLAGS += -Wundef
@@ -122,7 +121,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
  KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
  KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow)
  KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation)
-KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
  KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)

  ifdef CONFIG_CC_IS_CLANG


Thank you!
--
Gustavo


