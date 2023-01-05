Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C73565F62E
	for <lists+linux-next@lfdr.de>; Thu,  5 Jan 2023 22:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236007AbjAEVuG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Jan 2023 16:50:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236154AbjAEVte (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Jan 2023 16:49:34 -0500
X-Greylist: delayed 109 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 05 Jan 2023 13:47:53 PST
Received: from omta039.useast.a.cloudfilter.net (omta039.useast.a.cloudfilter.net [44.202.169.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2B072D1F
        for <linux-next@vger.kernel.org>; Thu,  5 Jan 2023 13:47:53 -0800 (PST)
Received: from eig-obgw-5020a.ext.cloudfilter.net ([10.0.29.203])
        by cmsmtp with ESMTP
        id DUMEpySCdJlHBDY3npOeuf; Thu, 05 Jan 2023 21:46:03 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with ESMTP
        id DY3mpiiggCiISDY3mpyJBe; Thu, 05 Jan 2023 21:46:03 +0000
X-Authority-Analysis: v=2.4 cv=HsNlpmfS c=1 sm=1 tr=0 ts=63b7451b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=wTog8WU66it3cfrESHnF4A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10 a=RvmDmJFTN0MA:10
 a=wYkD_t78qR0A:10 a=_AnF1TBu_7nj6opTY8AA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5/V2r2a5Cu2IhUj3HX5PU+deO7d6p4CisNPoCytN/tM=; b=sOgtd0Y+rkEyNCoNO+FTjWhzFL
        +t5D3G6TTU9p7iRRsEg0k/1kvbu6/MtMFdlEiIFbIUzAf6IZe8OmkUMlOlCJZIEh2Umn1yD7k/upm
        V7hwbi8XY04bQPaiizq2Y6e5M3xHpaGBzyLqZSZiv7+/WxAkJbCG8P9fL7zW8oqJBepDTnT+Ktnrc
        cCT5t2qUQbVHOhKXBPmeVw0cdOhGRtfZt5Wz4oF3z3FZ3cOBpRUekXKzLZUOnx6XKTHAmRhGGDYYR
        yuXXA6JFuwDRI+670+4HqXGswrhf3v1YUm8cFiiDRlw2hz40+Srcym7UZHNcoUKu6fqkX5G1aoIal
        /QIkJpCQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:56610 helo=[192.168.15.7])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <gustavo@embeddedor.com>)
        id 1pDY3m-0015Yp-7O;
        Thu, 05 Jan 2023 15:46:02 -0600
Message-ID: <4d8e55b8-6f52-6261-b406-4dffea62d5a0@embeddedor.com>
Date:   Thu, 5 Jan 2023 15:46:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: linux-next: duplicate patch in the kspp-gustavo tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230105085250.03cb9321@canb.auug.org.au>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230105085250.03cb9321@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1pDY3m-0015Yp-7O
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.7]) [187.162.31.110]:56610
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org:  HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPrHoMRyqWW/ltOaQHrjPKhztp3kZrFP6YzqYZkd02DpqbhZ7oxENtLnqX2pPBpXi7QPbnsqE3h1jZMfommYFK8XYQkE9oVXWgiaryuqSNt1qIegGF6X
 mZxpMtN6ZFM/kdOibPNgHA3XTbjNwpb5fXcPHwgSFVoChLd9lwu2vpMzSmndMSdUkZQqFg88FKOM5s6Y9MLwjTBFjrKt+1bSxfTzwS4VWjOBNN+XNU10PR88
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 1/4/23 15:52, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit already exists in Linus Torvald's tree as a different
> commit (but the same patch):
> 
>    7626d500ecca ("can: etas_es58x: Replace zero-length array with DECLARE_FLEX_ARRAY() helper")
> 

I'll remove that from my tree.

Thanks for the report!
--
Gustavo

