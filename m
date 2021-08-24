Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC4F3F5DC9
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 14:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236969AbhHXMUR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Aug 2021 08:20:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6482 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236676AbhHXMUP (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Aug 2021 08:20:15 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17OC7hPd122439;
        Tue, 24 Aug 2021 08:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=qcMgUNY44zGBRdaSAAGCc6dbjzXQDyCZZ25O3cFPJqU=;
 b=D9IlWN4tIN5wMdoe4eoi/IUwWjFPGycGwgbd3hSWf0l+jV5sa3inKs2Wc3TwDGyL4wrT
 2LCXRpB5UlR2YSsatIHrH1YSPbxLbCcBTUlg16geTjn4VEt3sGs6+k21QFoOdDZziCgI
 g4TQ09lCZAE6kx1HOakPkuL20OWwvMB4xAzZ+Vk+n8IbHmkYbz/IWIMbjP26lOphXAQ1
 bAtrkCyxtcyJIQcFfHFYtvmBdK6rTXujGiZ/nJJa/Fuo9+zZTJ2cCvnuYEN7GljPOd/b
 Nuc/r23c8Nl0FOkql/ExgQnfiE6j4D2zSvq2sibRt9dEa3+6szNElmEUk7Y0p1xvpG8+ Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3amv7tya1d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Aug 2021 08:19:27 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17OC83gP124764;
        Tue, 24 Aug 2021 08:19:27 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3amv7ty9yh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Aug 2021 08:19:27 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17OC7ePh011810;
        Tue, 24 Aug 2021 12:19:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma04fra.de.ibm.com with ESMTP id 3ajs48md03-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Aug 2021 12:19:23 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 17OCJLXP56951134
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 12:19:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 392CD52054;
        Tue, 24 Aug 2021 12:19:21 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.160.88.64])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 727F05204E;
        Tue, 24 Aug 2021 12:19:19 +0000 (GMT)
Message-ID: <b20c9abd62a9f56f1da8a9ef22695ebbaa0499eb.camel@linux.ibm.com>
Subject: Re: linux-next: Fixes tag needs some work in the integrity tree
From:   Mimi Zohar <zohar@linux.ibm.com>
To:     THOBY Simon <Simon.THOBY@viveris.fr>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc:     Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Tue, 24 Aug 2021 08:19:18 -0400
In-Reply-To: <a37d31eb-7fe6-ce46-c40a-d30654394b3f@viveris.fr>
References: <20210824081849.75909e73@canb.auug.org.au>
         <a37d31eb-7fe6-ce46-c40a-d30654394b3f@viveris.fr>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IeQoDIShwXa1PVSMazzt8fnu4L80CXIA
X-Proofpoint-GUID: cZ6abZf1cpoINnGumz3WUYA4zTPzf0xW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-24_02:2021-08-24,2021-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240081
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 2021-08-24 at 07:11 +0000, THOBY Simon wrote:
> Hi Stephen,
> 
> On 8/24/21 12:18 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > In commit
> > 
> >   c594ea470f30 ("IMA: reject unknown hash algorithms in ima_get_hash_algo")
> > 
> > Fixes tag
> > 
> >   Fixes: 50f742dd9147 ("IMA: block writes of the security.ima xattr with
> > 
> > has these problem(s):
> > 
> >   - Subject has leading but no trailing parentheses
> >   - Subject has leading but no trailing quotes
> > 
> > Please do not split FIxes tags over more than one line.
> > 
> 
> It's my bad, I didn't check the line wrapping when I copy/pasted the tag :/
> 
> (btw checkpatch.pl doesn't detect this behavior, maybe this is something worth adding?)
> 
> Is there something I can do about it?
> I don't suppose we can fix the commit, that would break the history of linux-next
> (is it maybe acceptable considering it is a "staging area"?).
> 
> Sorry about that mistake,

Hi Simon,

Sorry, along with my other suggestions, adding the "Fixes" tag was sent
as a comment, which the mailer reformatted.   As it is the top of the
branch, I've amended the commit and pushed it out to Korg.

For future reference, "git log --pretty=fixes -1 --abbrev=12 <commit
number>"  produces the proper message.  The "--abbrev" value can be set
by defining core.abbrev=12 in the git config.

thanks,

Mimi

