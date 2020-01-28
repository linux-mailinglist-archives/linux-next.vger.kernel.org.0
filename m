Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B67014AEC0
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 05:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgA1EtA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 23:49:00 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:57902 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgA1EtA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jan 2020 23:49:00 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00S4mpug016309;
        Mon, 27 Jan 2020 22:48:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580186931;
        bh=kTS9wd2+alAAQtu+YNKx/BnZ0qUwrv3/nmc42J3DW2k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Y0MLwohphdAUerLuRVvfeZ0D9N0Lh0JjakyBh8A2JihqhKJgb7RFtdv8DXhWXzkOk
         Ggy8HvhSOGTD6wgPLWmNF2NUfr3S3yWHq7me7EU0KPcwtmyQkeP4RB4afQCghLCSZv
         VzQYGg7lz9s+njyf2931Y+AxsoidIwPSU7NPYKn0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00S4mpQd124214
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jan 2020 22:48:51 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 22:48:51 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 22:48:51 -0600
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00S4mnOT012763;
        Mon, 27 Jan 2020 22:48:50 -0600
Subject: Re: linux-next: Fixes tag needs some work in the phy-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
References: <20200128070521.129eb07a@canb.auug.org.au>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <698b79a0-33a1-3d1d-d842-aa24e4b6cdaa@ti.com>
Date:   Tue, 28 Jan 2020 10:22:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:73.0) Gecko/20100101
 Thunderbird/73.0
MIME-Version: 1.0
In-Reply-To: <20200128070521.129eb07a@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 28/01/20 1:35 am, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   0b96a3349af1 ("dt-bindings: fix compilation error of the example in intel,lgm-emmc-phy.yaml")
> 
> Fixes tag
> 
>   Fixes: 5bc999108025 ("dt-bindings: phy: intel-emmc-phy: Add YAML
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please keep Fixes tags on a single line.

Fixed this.

Thanks
Kishon
