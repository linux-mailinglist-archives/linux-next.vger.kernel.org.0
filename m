Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E68D016573A
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2020 06:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgBTFza (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Feb 2020 00:55:30 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:34320 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgBTFza (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Feb 2020 00:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=+eNQsSzMxKIRXtkGmW5paSfUyPGKx+4eYCIxkVfvX10=; b=CbW97kDsBMkSuye8j1XAw2xR5D
        YSkCbLJMFiY+iRIlFyoRLpawmeKmIOk+5gVTH5Sg7sHgXOU+wwCS5O4gmigAFvEUPvG5gdSPXUdqi
        enY6GcL+k3lAH7W9pxA7dLwp5d9MdZNLqTgW6eV73LDnpr+UTm4kHX8/51dYNojH7EdStbJjF3v71
        actu0U/bLh7l97IJTUY4MoWWliC7yXGLX1cl4xfcGDQ7EEfnLMUWLjUECJBoDGcm4kbtx1E7gsmhj
        ng9EB4LskVIDJw1m4GHnfl6PboX3DEg906vqlFDWH0se+opylFZHN1jMKlv5OIQDcCEQY8OiKWsiN
        cEuw7arw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j4eo4-0004pf-6J; Thu, 20 Feb 2020 05:55:28 +0000
Subject: Re: linux-next: Tree for Feb 20 (mmc/mmc_hsq.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Baolin Wang <baolin.wang@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
References: <20200220144408.359a7e02@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dba0c486-46e9-0b96-bd71-b9e81b362c85@infradead.org>
Date:   Wed, 19 Feb 2020 21:55:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220144408.359a7e02@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/19/20 7:44 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200219:
> 

on i386:

WARNING: modpost: missing MODULE_LICENSE() in drivers/mmc/host/mmc_hsq.o


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
