Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFBF17B5E58
	for <lists+linux-next@lfdr.de>; Tue,  3 Oct 2023 02:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjJCArO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Oct 2023 20:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjJCArO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Oct 2023 20:47:14 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A268AD
        for <linux-next@vger.kernel.org>; Mon,  2 Oct 2023 17:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1696294031; x=1727830031;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lJHTEeIMXcxkw0tGC0S2zg/ltb6YUncf/rwBUz7axpY=;
  b=O3JRQEVos/GEdddGL3vA528slQGUhdBVBo1eccemf4SNTumBmppmIV7V
   XTziunvFWno9/teYTmG2weVHxNBcU3biLB8H5hwimccuOjRt7iexZwW1j
   RsbVR/tLAQZzsYfKUVYui/V3lbF0TjNmyo/ohacWr5JSTHFe8jKWIp9g1
   V4yOBiLcGhLFwo2sxsZXEi8o7kUj1CXJUVEOCdFFYruVCm2Vw4mS/s2LO
   VtUgqLsuwguTryLIegos6902dt9sq7hMWwjBmcNV/fTyLcCNwJ9Syol/P
   1DL+sIbaqp+liIAHT1qJQMuGMJfysCEbioivAcMpQtV5ADLAensDnLJDG
   w==;
X-CSE-ConnectionGUID: UEp+AJVFTYmCuLC9opTpZQ==
X-CSE-MsgGUID: 5jzTKQWsSq2JZ/MCoymeAw==
X-IronPort-AV: E=Sophos;i="6.03,194,1694707200"; 
   d="scan'208";a="245837820"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2023 08:47:10 +0800
IronPort-SDR: cmdgOxzKqt0jZoCJalDZ9EwSrnlCwXr3BvO2sFHayd2tsfjZeAs9h/TYgKsy4YOzPbgdqMi1UK
 vQsQ6P+1GHn6/G/6CUVsO9rCZgZ0bwyMDbK07lCft9acuHJ6EIk9TUs9DFHLjYMxY8qpZSgVra
 akGNV0mIIZAjMMxH5H5c+scVVxF8qR6OHl4wzHVnWAaBf13SuvYVHBjhrAotNPxHkpZz1ikTOH
 rn0tLYXWJ86N7Io4w2JFD8j2bRE9aN/WoSpar77WU/1t8M27lD5P+q5SSyYlEUBE3pO2oLmg71
 pu4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Oct 2023 16:59:30 -0700
IronPort-SDR: 7b16xdv2k34T9TOVqZ9ipws2w3fmdLCHKgTyqbETrqp2TUK0dhvApf7WQ7EjlOFx4VjWogfElK
 HI8K0Mw2vDatL6U1aPqaNKmVcAV5oJQA9OCEDu/fAHtZgwTIOD8zsv+sjstRtbFk3hlGief4UR
 Ks5HL4UC7ND+bdorUrny5CBaz0K5i+4PjaH/lQTMpCndl6ztRAwDCdt6BJ8YvMVnozdiGzfL68
 Ei83+U6JcWGZdWceQM72a8TbvwctSQ0COH08SjfGfrI+ZfvarPfezIDpBNBy/CJQfBH2zuPzuR
 QWM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Oct 2023 17:47:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Rzzg215r3z1RtVS
        for <linux-next@vger.kernel.org>; Mon,  2 Oct 2023 17:47:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1696294015; x=1698886016; bh=lJHTEeIMXcxkw0tGC0S2zg/ltb6YUncf/rw
        BUz7axpY=; b=Kv4E6J6kqsFFGkhgFVKpmvuItG2QFJDEgJD8w78gVTHvj+s/UUw
        wCK2eqD5+sJ6vScMMiIxmti3vVRLi6RthORz08kCPfUL0+0enMoD0uoNm87cNB5D
        taoJjhD1sYGdUdGFVB27LuJX18OQmsD05qgiSZFPDbEnOn8ymW9plTM2nx7aOyet
        34ZFnR0WR8z9/kA4cJ5YgIZHEf+vc1MgX7B8dg4SU1eZe0gilWd6KnD/4JJVibZ1
        1g2dNXIU2qIq/UaW2vc1u9CzjaV30yppFIHkuT0KEVRwWy4cwo9oqVFZ/Sp1N7+R
        x/JBFxUd0MdlHLXU9U7kFiQK31sjpez9xXg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id l0ny_5Y5aLjY for <linux-next@vger.kernel.org>;
        Mon,  2 Oct 2023 17:46:55 -0700 (PDT)
Received: from [10.225.163.119] (unknown [10.225.163.119])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Rzzfl1YBfz1RtVG;
        Mon,  2 Oct 2023 17:46:54 -0700 (PDT)
Message-ID: <5d208a9d-1bdc-57a3-1a1d-1b84796a2573@opensource.wdc.com>
Date:   Tue, 3 Oct 2023 09:46:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: linux-next: duplicate patches in the libata tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231003080744.69ca4ed0@canb.auug.org.au>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20231003080744.69ca4ed0@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/3/23 06:07, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
>   0e23330fccd4 ("ata: libata-scsi: Disable scsi device manage_system_start_stop")
>   1cf14228f460 ("scsi: sd: Differentiate system and runtime start/stop management")
>   540bd522a82e ("ata: libata-scsi: link ata port and scsi device")
>   54e5c956a103 ("scsi: sd: Do not issue commands to suspended disks on shutdown")
>   6d62f34a6741 ("ata: libata-core: Fix ata_port_request_pm() locking")
>   7c412cfbeecf ("scsi: Do not attempt to rescan suspended devices")
>   9459518aba7b ("ata: libata-scsi: Fix delayed scsi_rescan_device() execution")
>   cb37013b985e ("ata: libata-eh: Fix compilation warning in ata_eh_link_report()")
>   e4bfeedb3b50 ("ata: libata-core: Fix port and device removal")
>   f215cc816f8f ("ata: libata-core: Do not register PM operations for SAS ports")
>   fdd57890e769 ("ata: libata-core: Fix compilation warning in ata_dev_config_ncq()")
> 

Stephen,

Now fixed. Apologies about the noise.

-- 
Damien Le Moal
Western Digital Research

