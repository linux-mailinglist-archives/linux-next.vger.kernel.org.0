Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6274134EA
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 15:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhIUN7j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Sep 2021 09:59:39 -0400
Received: from relaydlg-01.paragon-software.com ([81.5.88.159]:50827 "EHLO
        relaydlg-01.paragon-software.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233042AbhIUN7i (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Sep 2021 09:59:38 -0400
X-Greylist: delayed 484 seconds by postgrey-1.27 at vger.kernel.org; Tue, 21 Sep 2021 09:59:38 EDT
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
        by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id 83D7B821E9;
        Tue, 21 Sep 2021 16:50:03 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paragon-software.com; s=mail; t=1632232203;
        bh=69SZli9zXZUg9CaJRX5IXFLbxpHqZtCHlXL0CEwYyHE=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=nu59M+v3DIVWX4Bc7PgNccDY43d9jf24IMjr0DGdUr0S+6gnS2CRFXWdUuKCIc7FP
         CeH6Ixwsg2nrfqtXZ2N0Yo7MQaa1yvvaka0AH97IuCI6+ISo5UAL1DfsGqUFZlSv3Z
         VJTNtE2hiKLZni4cFQESVsQ/8gr6gUwxrsEux+68=
Received: from [192.168.211.136] (192.168.211.136) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 21 Sep 2021 16:50:03 +0300
Message-ID: <3320944d-8fac-0a22-ee38-f08974fcaed7@paragon-software.com>
Date:   Tue, 21 Sep 2021 16:50:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: linux-next: Fixes tag needs some work in the ntfs3 tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Kari Argillander <kari.argillander@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210921083158.261517da@canb.auug.org.au>
From:   Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20210921083158.261517da@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.136]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 21.09.2021 01:31, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   0412016e4807 ("fs/ntfs3: Fix wrong error message $Logfile -> $UpCase")
> 
> Fixes tag
> 
>   Fixes: 203c2b3a406a ("fs/ntfs3: Add initialization of super block")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> 

Hello.

You are right, correct SHA is 82cae269cfa9.
Sorry, I've missed this while applying patch.

As far as I know there is no way to fix this now -
commit is already in linux-next.
