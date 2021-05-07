Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D5237641F
	for <lists+linux-next@lfdr.de>; Fri,  7 May 2021 12:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233574AbhEGK5Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 7 May 2021 06:57:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55646 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230311AbhEGK5Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 May 2021 06:57:16 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 147AY7tc192942;
        Fri, 7 May 2021 06:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=kJI+hSEBDPUhSCcndOfhxKacZQDQREelvBjeQMQu80U=;
 b=Tcgnl3wD8BsyZT8XO9sRSBnj///x0LwCNDtby4XoZ8106nzbfiCdJrcDFfaB8C+ptjBQ
 CXbC6bc3to8dOVr9heBYo1Xy37POoakKBh9x0h40Bglo6AoWhPrbqlizfs+UXk6RvvPc
 MzgzhYDdVLebG+RqhFz5Z8b+inQEou4NGBwYKfEsDzKbSp1MQZdey600XuaCuo2WCyKD
 +5TR1mfic1CEbB/qlvRYdBoN12heMpp7ZTGfjm6sEVaGa0/kBbRf8w+X4ufzKbcSakyi
 pRhh/gtc8bLiVfuOgL1MOrLmp+6HllAu+u2YePIQQieE5M5b1uff0H9rYBgj2rEQRr64 /w== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 38d36bhpr6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 May 2021 06:55:59 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 147AYGDf193555;
        Fri, 7 May 2021 06:55:59 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
        by mx0b-001b2d01.pphosted.com with ESMTP id 38d36bhpqn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 May 2021 06:55:59 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
        by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 147AtsYd001564;
        Fri, 7 May 2021 10:55:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma01fra.de.ibm.com with ESMTP id 38csqgr4jm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 May 2021 10:55:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 147Att4n31392058
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 7 May 2021 10:55:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 14BA2AE058;
        Fri,  7 May 2021 10:55:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EFBE5AE051;
        Fri,  7 May 2021 10:55:53 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.148.157])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri,  7 May 2021 10:55:53 +0000 (GMT)
Date:   Fri, 7 May 2021 13:55:51 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: linux-next: manual merge of the akpm tree with the risc-v tree
Message-ID: <YJUct6iDWVbybAmr@linux.ibm.com>
References: <20210507112426.7ed1f439@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507112426.7ed1f439@canb.auug.org.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PEtAd7jL8BBlksclqEJ8bbrUS_dcnnhM
X-Proofpoint-ORIG-GUID: L5V2n2Q1KIgrPCsnlcOjbnMxucqF2L7h
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-07_03:2021-05-06,2021-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105070071
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 07, 2021 at 11:24:26AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm tree got a conflict in:
> 
>   arch/riscv/include/asm/set_memory.h
> 
> between commit:
> 
>   8d91b0973358 ("riscv: Consistify protect_kernel_linear_mapping_text_rodata() use")
> 
> from the risc-v tree and commit:
> 
>   e022d55b4d97 ("set_memory: allow set_direct_map_*_noflush() for multiple pages")
> 
> from the akpm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/riscv/include/asm/set_memory.h
> index 086f757e8ba3,b766f2ccd9de..000000000000
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@@ -26,14 -27,8 +26,14 @@@ static inline void protect_kernel_text_
>   static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
>   #endif
>   
>  +#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
>  +void protect_kernel_linear_mapping_text_rodata(void);
>  +#else
>  +static inline void protect_kernel_linear_mapping_text_rodata(void) {}
>  +#endif
>  +
> - int set_direct_map_invalid_noflush(struct page *page);
> - int set_direct_map_default_noflush(struct page *page);
> + int set_direct_map_invalid_noflush(struct page *page, int numpages);
> + int set_direct_map_default_noflush(struct page *page, int numpages);
>   bool kernel_page_present(struct page *page);

Ack, thanks Stephen!
   
>   #endif /* __ASSEMBLY__ */

-- 
Sincerely yours,
Mike.
